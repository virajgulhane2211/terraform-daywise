resource "aws_instance" "dev" {
    ami = "ami-05c179eced2eb9b5b"
    instance_type = "t2.micro"
    key_name = "aws_key"
    availability_zone = "ap-south-1a"
    user_data = file("test.sh")
    tags = {
      Name = "dev"
    }
}