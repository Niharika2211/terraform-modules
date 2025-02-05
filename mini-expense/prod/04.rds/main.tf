module "mini_rds" {
  source                 = "../../../my-module/rds"
  envirnoment            = var.envirnoment
  project-name           = var.project-name
  common_tags            = var.common_tags
  db_name                = "transactions"
  port                   = "3306"
  allocated_storage      = 20
  engine                 = "mysql"
  username               = "admin"
  password               = "ExpenseApp1"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.db.value]
  db_subnet_group        = data.aws_ssm_parameter.db_subnet_group.value
  skip_final_snapshot    = true
}


resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = "${var.envirnoment}-${var.project-name}"
  type    = "CNAME"
  ttl     = 300
  records = [module.mini_rds.aws_db_instance]
}
