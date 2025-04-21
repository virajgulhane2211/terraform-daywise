provider "aws" {
  region = "ap-south-1" # Mumbai
}

# Create the Transit Gateway
resource "aws_ec2_transit_gateway" "tgw" {
  description = "Example Transit Gateway"
  auto_accept_shared_attachments = "enable"

  tags = {
    Name = "example-tgw"
  }
}

# Create VPC-1
resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC-1"
  }
}

# Create VPC-2
resource "aws_vpc" "vpc2" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "VPC-2"
  }
}

# Create Subnets
resource "aws_subnet" "vpc1_subnet" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "vpc2_subnet" {
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = "192.168.1.0/24"
  availability_zone = "ap-south-1a"
}

# TGW Attachments
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc1_attachment" {
  subnet_ids         = [aws_subnet.vpc1_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc1.id

  tags = {
    Name = "VPC-1-TGW-Attachment"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc2_attachment" {
  subnet_ids         = [aws_subnet.vpc2_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  vpc_id             = aws_vpc.vpc2.id

  tags = {
    Name = "VPC-2-TGW-Attachment"
  }
}

# Route Tables for Inter-VPC Routing
resource "aws_route_table" "vpc1_rt" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block         = aws_vpc.vpc2.cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    Name = "VPC-1-RT"
  }
}

resource "aws_route_table" "vpc2_rt" {
  vpc_id = aws_vpc.vpc2.id

  route {
    cidr_block         = aws_vpc.vpc1.cidr_block
    transit_gateway_id = aws_ec2_transit_gateway.tgw.id
  }

  tags = {
    Name = "VPC-2-RT"
  }
}

# Associate Subnets to Route Tables
resource "aws_route_table_association" "vpc1_assoc" {
  subnet_id      = aws_subnet.vpc1_subnet.id
  route_table_id = aws_route_table.vpc1_rt.id
}

resource "aws_route_table_association" "vpc2_assoc" {
  subnet_id      = aws_subnet.vpc2_subnet.id
  route_table_id = aws_route_table.vpc2_rt.id
}

# Security Group for both VPCs
resource "aws_security_group" "allow_all" {
  name        = "allow-all"
  description = "Allow all inbound and outbound traffic"
  vpc_id      = aws_vpc.vpc1.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "AllowAll"
  }
}

# EC2 Instance in VPC-1
resource "aws_instance" "vpc1_instance" {
  ami                         = "ami-002f6e91abff6eb96"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.vpc1_subnet.id
  key_name                    = "mumbai"
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true

  tags = {
    Name = "Instance-VPC-1"
  }
}

# EC2 Instance in VPC-2
resource "aws_security_group" "allow_all_vpc2" {
  name        = "allow-all-vpc2"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.vpc2.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "vpc2_instance" {
  ami                         = "ami-002f6e91abff6eb96"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.vpc2_subnet.id
  key_name                    = "mumbai"
  vpc_security_group_ids      = [aws_security_group.allow_all_vpc2.id]
  associate_public_ip_address = true

  tags = {
    Name = "Instance-VPC-2"
  }
}
