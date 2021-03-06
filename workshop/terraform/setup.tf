provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "abedra-tfstate" {
  bucket = "abedra-tfstate"
  acl = "private"
  force_destroy = true
  versioning {
    enabled  = true
  }
}

terraform {
  backend "s3" {
    bucket = "abedra-tfstate"
    key = "setup/terraform.tfstate"
    region = "us-east-2"
  }
}
