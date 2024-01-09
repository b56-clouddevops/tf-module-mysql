locals {
   MYSQL_USERNAME = jsondecode(data.aws_secretsmanager_secret_version.secret_version.secret_string)["MYSQL_USERNAME"]
   MYSQL_PASSWORD = jsondecode(data.aws_secretsmanager_secret_version.secret_version.secret_string)["MYSQL_PASSWORD"]
}