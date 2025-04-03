resource "aws_instance" "name" {
    ami = "ami-05c179eced2eb9b5b"
    key_name = "aws_key"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "Mumbai-Server-1"
    }
  
}