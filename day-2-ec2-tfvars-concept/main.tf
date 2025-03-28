resource "aws_instance" "name" {
    ami = var.image
    instance_type = var.type
    key_name = var.key
    tags = {
      Name="Mumba-Server"
    }
}