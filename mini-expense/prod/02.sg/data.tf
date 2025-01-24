data "aws_ssm_parameter" "mini_vpc" {
  name = "${var.envirnoment}-${var.project-name}-vpc"
}