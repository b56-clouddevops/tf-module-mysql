resource "null_resource" "schema" {

    # This make sures that this null_resource will only be executed post the creation of the RDS only    
    depends_on = [aws_db_instance.default]

      provisioner "local-exec" {
        command = <<EOF
            cd /tmp
            curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
            unzip -o mysql.zip
            mysql -h aws_db_instance.default.address  -uadmin1 -proboshop1 < shipping.sql
        EOF
    }
}
