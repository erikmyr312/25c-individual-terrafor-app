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