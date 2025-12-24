variable "environment" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "servers" {
  type = map(object({
    name          = string
    ami_id        = string
    instance_type = string
    key_name      = string
    subnet_id     = string
  }))
}

