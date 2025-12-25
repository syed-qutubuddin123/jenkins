environment = "dev"

vpc_name  = "dev-vpc"
alb_name  = "dev-alb"

vpc_cidr = "10.10.0.0/24"

public_subnets = {
  public-1 = { cidr = "10.10.0.0/28",  az = "ap-south-1a" }
  public-2 = { cidr = "10.10.0.16/28", az = "ap-south-1b" }
}

private_subnets = {
  private-1 = { cidr = "10.10.0.32/28", az = "ap-south-1a" }
  private-2 = { cidr = "10.10.0.48/28", az = "ap-south-1b" }
}

tags = {
  Environment = "dev"
}

