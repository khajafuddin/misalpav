terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_dynamodb_table" "state_locking" {
  hash_key = "LockID"
  name     = "dynamodb-state-locking"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}

resource "aws_instance" "ec2_example" {
  ami           = "ami-0e670eb768a5fc3d4"
  instance_type = "t2.micro"
  tags = {
    Name = "EC2 Instance with remote state"
  }
  depends_on = [aws_dynamodb_table.state_locking]
}

terraform {
  backend "s3" {
    bucket         = "misalpav-bucket1"
    key            = "s3/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "dynamodb-state-locking"
    depends_on = [aws_dynamodb_table.state_locking]
  }
}
   
