# To create Public server
resource "aws_instance" "public" {
  ami                         = "ami-002f6e91abff6eb96" # Make sure this AMI is valid in ap-south-1
  instance_type               = "t2.micro"
  key_name                    = "mumbai"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.sg_allow.id]
  associate_public_ip_address = true

  tags = {
    Name = "Mumbai-Public"
  }
}

# To create Private server
resource "aws_instance" "private" {
  ami                    = "ami-002f6e91abff6eb96"
  instance_type          = "t2.micro"
  key_name               = "mumbai"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.sg_allow.id]

  tags = {
    Name = "Mumbai-Private"
  }
}
