environment = "prod"

vpc_name  = "prod-vpc"
alb_name  = "prod-lb"

vpc_cidr = "10.20.0.0/24"

public_subnets = {
  public-1 = { cidr = "10.20.0.0/28",  az = "ap-south-1a" }
  public-2 = { cidr = "10.20.0.16/28", az = "ap-south-1b" }
}

private_subnets = {
  private-1 = { cidr = "10.20.0.32/28", az = "ap-south-1a" }
  private-2 = { cidr = "10.20.0.48/28", az = "ap-south-1b" }
}

tags = {
  Environment = "prod"
}

