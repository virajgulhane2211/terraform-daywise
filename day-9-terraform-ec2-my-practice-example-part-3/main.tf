module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "aws_key"
  monitoring             = true
  vpc_security_group_ids = ["sg-03f6d5092af6c4df7"]
  subnet_id              = "subnet-0a33e09b236f33707"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

provider "aws" {
    region = "ap-south-1"
  
}