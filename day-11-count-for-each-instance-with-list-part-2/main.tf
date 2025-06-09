provider "aws" {
    region = "ap-south-1"
  
}
variable "ami" {
    type = string
    default = "ami-05c179eced2eb9b5b"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "name" {
    type = list(string)
    default = [ "dev","test","prod" ]
}

#main.tf
resource "aws_instance" "sandbox" {
    ami = var.ami
    instance_type = var.instance_type
    count = length(var.name)
    tags = {
      Name=var.name[count.index]
    }
}

