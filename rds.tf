# Provisions RDS Instance
resource "aws_db_instance" "default" {
  allocated_storage       = var.MYSQL_STORAGE
  identifier              = "roboshop-${var.ENV}-mysql"
  engine                  = var.MYSQL_ENGINE
  engine_version          = var.MYSQL_ENGINE_VERSION
  instance_class          = var.MYSQL_ENGINE_TYPE
  username                = local.MYSQL_USERNAME
  password                = local.MYSQL_PASSWORD
  parameter_group_name    = aws_db_parameter_group.mysql.name
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.mysql.name
  vpc_security_group_ids  = [aws_security_group.allow_mysql.id]
}

# Provisions RDS Parameter Group
resource "aws_db_parameter_group" "mysql" {
  name   = "roboshop-${var.ENV}-mysql-pg"
  family = var.MYSQL_FAMILY
}

# # Creates a subnet-groups
resource "aws_db_subnet_group" "mysql" {
  name       = "roboshop-${var.ENV}-mysql-subnet-group"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "roboshop-${var.ENV}-mysql-subnet-group"
  }
}
