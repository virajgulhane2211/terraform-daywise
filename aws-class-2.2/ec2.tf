#Create public Servers 

resource "aws_instance" "dev" {
    ami = "ami-076c6dbba59aa92e6"
    instance_type = "t2.micro"
    key_name = "mumbai"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
    associate_public_ip_address = true
    tags = {
      Name = "dev_ec2"
    }
  
}

# Create private server 