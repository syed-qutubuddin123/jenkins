variable "environment" {}
variable "servers" {
  type = map(object({
    name          = string
    ami_id        = string
    instance_type = string
    key_name      = string
    subnet_id     = string
  }))
}
variable "private_subnets" { type = list(string) }
variable "alb_sg_id" {}
variable "vpc_id" {}
