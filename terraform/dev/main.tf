# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# 1. Network Layer
module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = "${var.project_name}-vpc"
  cidr_block      = var.vpc_cidr
  public_subnets  = var.public_subnets
  database_subnets = var.database_subnets
}

# 2. Database Layer
module "rds" {
  source               = "./modules/rds"
  db_name              = var.db_name
  vpc_id               = module.vpc.vpc_id
  db_subnet_group_name = module.vpc.database_subnet_group_name
  # Allow traffic from this specific security group
  allowed_security_groups = [module.web_app.security_group_id]
}

# 3. Compute Layer
module "web_app" {
  source        = "./modules/ec2"
  instance_type = var.instance_type
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnets[0]
}

