#To create server 
resource "aws_instance" "name" {
    ami = "ami-002f6e91abff6eb96"
    instance_type = "t2.micro"
    key_name = "mumbai"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.sg_allow.id]
    associate_public_ip_address = true
    user_data = file("test.sh")
    tags = {
      Name = "Mumbai-Server"
    }
  
}