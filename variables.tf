variable "environment" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "alb_name" {
  type = string
}

variable "vpc_cidr" {
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

variable "tags" {
  type = map(string)
}

variable "zone_name" {
  type = string
}

variable "server_records" {
  type    = map(string)
  default = {}
}


