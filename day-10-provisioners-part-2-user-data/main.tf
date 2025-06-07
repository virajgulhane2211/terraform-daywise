provider "aws" {
  region = "us-east-1"
}

# Security Group to allow SSH access
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Consider replacing with your IP for better security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Key pair
resource "aws_key_pair" "name" {
  key_name   = "testpublic"
  public_key = file("~/.ssh/id_rsa.pub") # Define path to your public key
}

# EC2 instance with provisioners
resource "aws_instance" "example" {
  ami           = "ami-02457590d33d576c3" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.name.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  provisioner "remote-exec" {
    inline = [
      "while sudo fuser /var/run/yum.pid >/dev/null 2>&1; do echo 'Waiting for yum...'; sleep 5; done",
      "sudo yum update -y",
      "sudo yum install -y httpd git",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
      "sudo mkdir -p /var/www/html",
      "echo 'Git installed successfully!' | sudo tee /var/www/html/git_installed.txt"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa") # Path to your private key
      host        = self.public_ip
    }
  }

  provisioner "local-exec" {
    command = "echo Instance created with IP: ${self.public_ip} >> instance_ips.txt"
  }
}
