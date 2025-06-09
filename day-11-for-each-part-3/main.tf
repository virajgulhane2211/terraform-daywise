provider "aws" {
  region = "ap-south-1"
}


variable "ami" {
  type    = string
  default = "ami-05c179eced2eb9b5b"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "env" {
  type    = list(string)
  default = ["dev","test","prod"]
}

resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  for_each      = toset(var.env)
#   count = length(var.env)  

  tags = {
    Name = each.value # for a set, each.value and each.key is the same
  }
}