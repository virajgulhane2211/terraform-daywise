#Local are constant value, Variable value is changable where as local values are vixed.

locals {
  region        = "us-east-1"
  instance_type = {dev = "t2.micro", test = "t2.nano"}
  ami = "ami-05c179eced2eb9b5b"
}

resource "aws_instance" "example" {
  ami           = local.ami
  instance_type = local.instance_type.dev
  tags = {
    Name = "App-${local.region}"
  }
}
