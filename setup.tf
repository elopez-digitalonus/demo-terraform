terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.50.0"
    }
  }
  required_version = ">= 0.13"
  backend "s3" {
    region = "eu-north-1"
    key    = "terraform.tfstate"
    bucket = "0545"
  }
}

provider "aws" {
  region = var.region_name
}
