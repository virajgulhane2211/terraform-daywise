module "test" {
    source = "../day-8-module-example-2"
    ami_id ="ami-0e449927258d45bc4"
    instance_type = "t2.micro"
    key_name = "newkey"
}