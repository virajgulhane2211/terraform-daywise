provider "aws" {
  
}
resource "aws_instance" "dependent" {
    ami = "ami-05c179eced2eb9b5b"
    instance_type = "t2.micro"
    key_name = "public"
}

resource "aws_s3_bucket" "dependent" {
    bucket = "ytvhshfbbccccc" 
}

#terraform apply -target=aws_s3_bucket.dependent 
#terraform destroy -target=aws_s3_bucket.dependent
#terraform apply -target=aws_s3_bucket.dependent -target=aws_s3_bucket.dependent #by calling multiple resources 