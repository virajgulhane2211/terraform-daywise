resource "aws_instance" "dependent" {
    ami = "ami-05c179eced2eb9b5b"
    instance_type = "t2.micro"
    key_name = "aws_key"
}

resource "aws_s3_bucket" "dependent" {
    bucket = "ytvhshfbbcccccc" 
    depends_on = [ aws_instance.dependent ]
}
#Dependant block menas, after creating depending resources, next resources will be created.
#Here first ec2 will create then s3 bucket will create 
