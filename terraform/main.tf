module "vpc" {
  source = "./modules/vpc"

  name = "app3-dev"

  vpc_cidr = "10.0.0.0/16"

  azs = ["us-east-1a", "us-east-1b"]

  public_subnet_cidrs  = ["10.0.10.0/24", "10.0.11.0/24"]
  private_subnet_cidrs = ["10.0.20.0/24", "10.0.21.0/24"]
}

module "rds" {
  source = "./modules/rds"

  name               = "app3-dev"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids

  db_name     = "app3"
  db_username = "app3admin"
  db_password = var.db_password
}
module "bastion" {
  source = "./modules/bastion"

  name             = "app3-dev"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]

  allowed_ssh_cidr = var.allowed_ssh_cidr
  key_name         = var.key_name

  db_security_group_id = module.rds.db_security_group_id
  db_port              = module.rds.db_port
}

module "maintenance_site" {
  source      = "./modules/s3_maintenance"
  bucket_name = var.maintenance_bucket_name
}

module "alb" {
  source = "./modules/alb"

  name              = "app3-dev"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids

  allowed_http_cidr = var.allowed_http_cidr

  frontend_host = var.frontend_host
  backend_host  = var.backend_host

  frontend_port        = 80
  backend_port         = 8080
  frontend_health_path = "/"
  backend_health_path  = "/"
  certificate_arn      = module.acm.certificate_arn
  enable_https         = var.enable_https
}

module "acm" {
  source      = "./modules/acm"
  domain_name = var.acm_domain_name
  tags = {
    Name = "app3-acm-cert"
  }
}

module "frontend_asg" {

  source            = "./modules/autoscaling"
  name              = "frontend"
  ami_id            = var.frontend_ami_id
  subnet_ids        = module.vpc.public_subnet_ids
  target_group_arns = [module.alb.frontend_target_group_arn]
  key_name          = var.key_name

}

module "backend_asg" {

  source            = "./modules/autoscaling"
  name              = "backend"
  ami_id            = var.backend_ami_id
  subnet_ids        = module.vpc.private_subnet_ids
  target_group_arns = [module.alb.backend_target_group_arn]
  key_name          = var.key_name

}

module "cloudwatch" {

  source         = "./modules/cloudwatch"
  alb_arn_suffix = module.alb.alb_arn_suffix
  rds_identifier = module.rds.db_instance_identifie
  dashboard_name = "app-monitoring"

}