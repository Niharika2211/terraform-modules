data "aws_ssm_parameter" "pub_sub_ids" {
  name = "/${var.envirnoment}/${var.project_name}/pub-sub"

}

data "aws_ssm_parameter" "pvt_sub_ids" {
  name = "/${var.envirnoment}/${var.project_name}/pvt-sub"
}


data "aws_ssm_parameter" "external_lb" {
  name = "${var.envirnoment}-${var.project_name}-external-sg"

}

data "aws_ssm_parameter" "internal_lb" {
  name = "${var.envirnoment}-${var.project_name}-internal-sg"
}
