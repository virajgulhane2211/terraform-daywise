provider "aws" {
  
}
resource "aws_key_pair" "name" {
    key_name = "testpublic-1"
    public_key = file("~/.ssh/id_rsa.pub") #here you need to define public key file path
}

resource "aws_instance" "dev" {
  ami                    = "ami-076c6dbba59aa92e6"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.name.key_name
  tags = {
    Name="key-tf"
  }
}