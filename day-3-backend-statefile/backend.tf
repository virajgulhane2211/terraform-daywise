terraform {
  backend "s3" {
    bucket = "common-for-linux-windo"
    key = "terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
  }
}