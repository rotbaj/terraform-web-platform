# --- Networking Module ---
module "networking" {
  source = "../../modules/networking"

  aws_region           = var.aws_region
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# --- Database Module ---
module "database" {
  source = "../../modules/database"

  environment       = var.environment
  vpc_id            = module.networking.vpc_id
  db_subnet_ids     = module.networking.private_subnet_ids
  db_sg_id          = module.networking.db_sg_id
  db_instance_class = var.db_instance_class
  db_username       = var.db_username
  db_password       = var.db_password
}

# --- Compute Module ---
module "compute" {
  source = "../../modules/compute"

  environment        = var.environment
  vpc_id             = module.networking.vpc_id
  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids
  alb_sg_id          = module.networking.alb_sg_id
  web_sg_id          = module.networking.web_sg_id
  instance_type      = var.instance_type
  asg_min_size       = var.asg_min_size
  asg_max_size       = var.asg_max_size
}