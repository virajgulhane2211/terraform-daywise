ami = "ami-076c6dbba59aa92e6"
instance_type = "t2.micro"
key_name = "mumbai"

#1st way to access
#terraform plan -var="ami=ami-076c6dbba59aa92e6" -var="instance_type=t2.micro" -var="key_name=mumbai"

#2nd way to access
#terraform plan -var-file="dev.tfvars"
