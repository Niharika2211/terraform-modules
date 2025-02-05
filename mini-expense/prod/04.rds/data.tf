data "aws_ssm_parameter" "db_subnet_group" {
  name = "/${var.envirnoment}/${var.project-name}/db-subnet-group"
}
data "aws_ssm_parameter" "db" {
  name = "${var.envirnoment}-${var.project-name}-db-sg"
}