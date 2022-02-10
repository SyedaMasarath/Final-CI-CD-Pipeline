resource "aws_db_instance" "default" {
allocated_storage = 20
identifier = "sampleinstance"
storage_type = "gp2"
engine = "mysql"
engine_version = "5.7"
instance_class = "db.m4.medium"
name = "sample"
username = "dbadmin"
password = "DBAdmin@5#41$32"
parameter_group_name = "default.mysql5.7"
}
#aws_db_instance – RDS instance as a resource
#identifier – A unique name for the DB Instance
#engine_version – DB version to use

