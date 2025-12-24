terraform {
  backend "s3" {
    bucket = "farhan-bucket-terraform"
    key    = "env/terraform.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}
