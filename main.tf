module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  vpc_name        = "${var.environment}-vpc"
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "alb" {
  source       = "./modules/alb"
  environment  = var.environment
  alb_name     = "${var.environment}-alb"
  alb_subnets  = module.vpc.public_subnets
  vpc_id       = module.vpc.vpc_id
}

module "servers" {
  source          = "./modules/ec2"
  environment     = var.environment
  servers         = var.servers
  private_subnets = module.vpc.private_subnets
  alb_sg_id       = module.alb.alb_sg_id
  vpc_id          = module.vpc.vpc_id
}

module "route53" {
  source = "./modules/r53"

  zone_name = "syedonline.site"

  server_records = {
    "dev1.success.syedonline.site" = module.servers.private_ips["dev1"]
  }
}

resource "aws_lb_target_group_attachment" "attach" {
  for_each = module.servers.instance_ids_map

  target_group_arn = module.alb.tg_arn
  target_id        = each.value
  port             = 80
}
