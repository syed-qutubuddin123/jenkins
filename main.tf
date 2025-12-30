module "vpc" {
  source          = "./modules/vpc"
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "alb" {
  source = "./modules/alb"

  alb_name          = var.alb_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  tags              = var.tags

  ec2_instance_id   = module.ec2.instance_id
}


module "ec2" {
  source = "./modules/ec2"

  name          = "${var.environment}-ec2"
  ami_id        = "ami-0f5ee92e2d63afc18"
  instance_type = "t3.micro"
  subnet_id     = module.vpc.public_subnet_ids[0]
  vpc_id        = module.vpc.vpc_id
  environment   = var.environment
}

module "route53" {
  source = "./modules/r53"

  zone_name = var.zone_name

  server_records = var.server_records
}


