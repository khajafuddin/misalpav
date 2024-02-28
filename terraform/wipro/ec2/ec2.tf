terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
    }
  }
}

provider "aws" {

  region     = "ap-south-1"
}

resource "aws_instance" "instance1" {
  ami           = "ami-0e670eb768a5fc3d4"
  instance_type = "t2.micro"
  tags = {
    "Name" = "webserver"
  }
}
