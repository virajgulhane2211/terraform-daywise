#To Create VPC
resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "test_server"
    }
}

#To Create Subnet Public
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "public_subnet"
    }
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "private_subnet"
    }
  
}

#To create IGW n to VPC
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
  
}

#To create route table and edit route 
resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id
    }
}

#Subnet Association to Route table
resource "aws_route_table_association" "dev" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.public.id
}

#Crerate SG
resource "aws_security_group" "sg_allow" {
    name = "sg_allow"
    vpc_id = aws_vpc.dev.id
    tags = {
      Name = "dev_sg"
    }
ingress {
    description = "from vpc"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
ingress {
    description = "from vpc"
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}
  
}