module "prod" {
    source = "github.com/virajgulhane2211/terraform-daywise/day-8-module-example-2/"
    ami_id ="ami-0f1dcc636b69a6438"
    instance_type = "t2.micro"
    key_name = "aws_key"
}