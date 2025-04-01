resource "aws_instance" "dev" {
    ami = "ami-076c6dbba59aa92e6"
    instance_type = "t2.micro"
    key_name = "aws_key"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "windows"
    }
   
}