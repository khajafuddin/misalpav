terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
    }
  }
}

provider "aws" {
  access_key = "AKIA4MTWJ5E7DS3ZVY4Y"
  secret_key = "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"
  region     = "ap-south-1"
}

resource "aws_instance" "instance1" {
  ami           = "ami-0e670eb768a5fc3d4"
  instance_type = "t2.micro"
  tags = {
    "Name" = "webserver"
  }
}
