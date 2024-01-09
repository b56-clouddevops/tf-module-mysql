# Creates Security Group For Document DB
resource "aws_security_group" "allow_mysql" {
  name                  = "roboshop-${var.ENV}-mysql-sg"
  description           = "roboshop-${var.ENV}-mysql-sg"
  vpc_id                = data.terraform_remote_state.vpc.outputs.VPC_ID

  ingress {
       description      = "MYSQL from Private Network"
       from_port        = var.MYSQL_PORT
       to_port          = var.MYSQL_PORT
       protocol         = "tcp"
       cidr_blocks      = [data.terraform_remote_state.vpc.outputs.DEFAULT_VPC_CIDR, data.terraform_remote_state.vpc.outputs.VPC_CIDR]
  }

  egress {
       from_port        = 0
       to_port          = 0
       protocol         = "-1"
       cidr_blocks      = ["0.0.0.0/0"]
  }

    tags = {
      Name = "roboshop-${var.ENV}-mysql-sg"
    }
}
 

 