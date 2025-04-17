module "dev" {
    source = "../day-1-templates-for-modules"
    ami_id = "ami-05c179eced2eb9b5b"
    type = "t2.micro"
    keyname = "mumbai"
  
}