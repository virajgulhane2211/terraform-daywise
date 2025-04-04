resource "aws_instance" "name" {
    #create ec2 manually
    ami = "ami-002f6e91abff6eb96"
    instance_type = "t2.nano"
    key_name = "mumbai"
    tags = {
      Name ="mumbai-server"
    }
  
}