resource "aws_instance" "name" {
    ami = "ami-076c6dbba59aa92e6"
    key_name = "aws-key"
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "Bombay-Server"
    }
  
}