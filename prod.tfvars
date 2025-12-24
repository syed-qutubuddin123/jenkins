environment = "prod"

vpc_cidr = "10.20.0.0/24"
vpc_name = "prod-vpc"

public_subnets = {
  public-1 = { cidr = "10.20.0.0/28", az = "ap-south-1a" }
  public-2 = { cidr = "10.20.0.16/28", az = "ap-south-1b" }
}

private_subnets = {
  private-1 = { cidr = "10.20.0.32/28", az = "ap-south-1a" }
  private-2 = { cidr = "10.20.0.48/28", az = "ap-south-1b" }
}

servers = {
  prod1 = {
    name          = "prod-server-1"
    ami_id        = "ami-02eb7a4783e7e9317"
    instance_type = "t3.micro"
    key_name      = "FC-key"
    subnet_id     = ""
  }
}
