provider "aws" {
  
}

resource "aws_instance" "name" {
  ami = "ami-05c179eced2eb9b5b"
  instance_type = "t2.micro"
  key_name = "mumbai"
  tags = {
    Name="Mumbai-Server-1"
  }
  availability_zone = "ap-south-1b"


  #rule-1 first create resources and then delete them
  #change AZ to ap-south-1b: ec2 from region ap-south-1b will be started & then
  # ap-south-1a instance will be deleted  
# lifecycle {
#     create_before_destroy = true
# }

#rule -2 :
#if you change ec2 instance name manually, then use terraform apply , no change will happen
# lifecycle {
#     ignore_changes = [ tags, ]
  
# }

#rule -3 : prevent destroy 
# lifecycle {
#   prevent_destroy = true
# }
  
}

