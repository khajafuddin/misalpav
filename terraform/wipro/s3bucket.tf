terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.38.0"
    }
  }
}

provider "aws" {
 region = "ap-south-1"
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "misalpav-bucket1"
  tags = {
    Name = "misalpav-bucket1"
  }
}
