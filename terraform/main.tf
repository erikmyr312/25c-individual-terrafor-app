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