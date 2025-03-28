resource "aws_instance" "name" {
    ami = var.ami
    instance_type = "t2.micro"
    key_name = var.key_name
    tags = {
      Name="Mumbai-Server"
    }
}