provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "dev" {
    ami = "ami-05c179eced2eb9b5b"
    key_name = "mumbai"
    instance_type = "t2.micro"
    count=2
    tags = {
      Name = "test-${count.index}"
    }
  
}