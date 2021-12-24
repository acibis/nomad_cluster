provider aws {
  region = "eu-central-1"
}

resource "aws_db_instance" "db_polymath" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "13.1"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true
  publicly_accessible  = true
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [var.vpc_security_group_ids]
  
  tags = {
      owner       = var.owner
      environment = var.project
      terraform   = "true"
    }
}