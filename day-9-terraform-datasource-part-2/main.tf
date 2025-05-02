module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.large"
  allocated_storage = 5

  db_name  = "demodb"
  username = "admin"
  port     = "3306"
  password = "srivardhan"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = ["sg-03f6d5092af6c4df7"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"
  create_monitoring_role = true

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group

    subnet_ids=[data.aws_subnet.subnet-1.id, data.aws_subnet.subnet-2.id]

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  # Database Deletion Protection
  deletion_protection = true


}