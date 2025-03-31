resource "aws_instance" "dev" {
    ami = "ami-071226ecf16aa7d96"
    instance_type = "t2.micro"
    key_name = "aws_key"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "windows"
    }
   
}