resource "aws_instance" "name" {
    ami = "ami-05c179eced2eb9b5b"
    instance_type = "t2.micro"
    key_name = "mumbai-2"
    tags = {
      Name="Terraform_Created_Server"
    }
  
}