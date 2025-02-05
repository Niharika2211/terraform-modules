resource "aws_ssm_parameter" "mini_vpc" {
  name  = "${var.envirnoment}-${var.project-name}-vpc"
  type  = "String"
  value = module.mini_vpc.vpc_id

}

resource "aws_ssm_parameter" "pub_sub_ids" {
  name  = "/${var.envirnoment}/${var.project-name}/pub-sub"
  type  = "StringList"
  value = join(",", module.mini_vpc.pub-sub-id)

}

resource "aws_ssm_parameter" "pvt_sub_ids" {
  name  = "/${var.envirnoment}/${var.project-name}/pvt-sub"
  type  = "StringList"
  value = join(",", module.mini_vpc.pvt-sub-id)

}


resource "aws_ssm_parameter" "db_sub_ids" {
  name  = "/${var.envirnoment}/${var.project-name}/db-sub"
  type  = "StringList"
  value = join(",", module.mini_vpc.db-sub-id)

}

resource "aws_ssm_parameter" "db_subnet_group" {
  name  = "/${var.envirnoment}/${var.project-name}/db-subnet-group"
  type  = "String"
  value = module.mini_vpc.db_subnet_group_name
}