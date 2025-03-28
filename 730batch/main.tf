resource "aws_instance" "name" {
    ami = "ami-076c6dbba59aa92e6"
    key_name = "mumbai"
    instance_type = "t2.micro"

    tags = {
      Name = "Mumbai"
    }
  
  
}