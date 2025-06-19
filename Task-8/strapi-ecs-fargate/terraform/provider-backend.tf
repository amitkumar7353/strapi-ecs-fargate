terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket = var.backend_bucket
    key    = "strapi/ecs/terraform.tfstate"
    region = var.aws_region
  }
}

provider "aws" {
  region = var.aws_region
}

