resource "aws_instance" "name" {
    ami = "ami-002f6e91abff6eb96"
    instance_type = "t2.micro"
    key_name = "mumbai"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "mumbai-server"
    }
}
