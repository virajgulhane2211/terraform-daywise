provider "aws" {
    region = "us-east-1"
  
}

#variables
variable "bucket_name" {
    description = "Name of S3 Bucket"
    type = string
    default = "virajg2121"
}

variable "tags" {
    description = "Tags to assign to s3 bucket"
    type = map(string)
    default = {
      Environment = "dev"
      Owner="Team"
    }
}

#Locals
locals {
  bucket_name = "${var.bucket_name}-1234"
  acl = "private"
}