terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "eu-north-1"
  access_key = "AKIATYESCEMZZVGIQCUO"
  secret_key = "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"
}

resource "aws_instance" "app_server" {
  ami           = "ami-00888f2a5f9be4390"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-d8f15ebe"]
  subnet_id              = "subnet-91e73adc"

  tags = {
    Name = var.instance_name
  }
}