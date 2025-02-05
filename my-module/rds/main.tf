locals {
  name = "${var.envirnoment}-${var.project-name}"
}
resource "aws_db_instance" "this_rds" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  port                 = var.port
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  skip_final_snapshot  = var.skip_final_snapshot
  identifier = local.name
  db_subnet_group_name = var.db_subnet_group
  vpc_security_group_ids = var.vpc_security_group_ids
   tags = merge(
    {
      Name = local.name,
    },
    var.common_tags
  )
}