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
  access_key = "AKIATYESCEMZQUUCPP77"
  secret_key = "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"
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "app-server"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0567085e558e02053"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-d8f15ebe"]
  subnet_id              = "subnet-91e73adc"

  tags = {
    Name = var.instance_name
  }
}