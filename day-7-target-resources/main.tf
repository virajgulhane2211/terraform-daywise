provider "aws" {
  
}
resource "aws_instance" "depandent" {
  ami = "ami-05c179eced2eb9b5b"
  instance_type = "t2.micro"
  key_name = "mumbai"
  availability_zone = "ap-south-1a"
  tags = {
    Name="Mumbai-Server-1"
  }
}

resource "aws_s3_bucket" "depandent" {
    bucket = "viraj-99-0011-11"
  
}

#terraform  apply  -target=aws_s3_bucket.depandent
#-> only s3 bucket will be created no ec2 will be launched 

#terraform  destroy  -target=aws_s3_bucket.depandent
#-> only s3 bucket will be desroyed no ec2 if already created is destroyed 


# slly we can use it for ec2 also