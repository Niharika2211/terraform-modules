data "aws_ami" "backend" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["mini-backend-*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_ami" "frontend" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["mini-frontend-*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}


data "aws_ssm_parameter" "frontend" {
  name = "${var.envirnoment}-${var.project_name}-frontend-sg"

}

data "aws_ssm_parameter" "backend" {
  name = "${var.envirnoment}-${var.project_name}-backend-sg"
}

data "aws_ssm_parameter" "mini_vpc" {
  name = "${var.envirnoment}-${var.project_name}-vpc"

}


data "aws_ssm_parameter" "pvt_sub_ids" {
  name = "/${var.envirnoment}/${var.project_name}/pvt-sub"
}

data "aws_ssm_parameter" "internal_http_listner" {
  name = "/${var.envirnoment}/${var.project_name}/internal-http-listner"

}

data "aws_ssm_parameter" "external_https_listner" {
  name = "/${var.envirnoment}/${var.project_name}/external-https-listner"
}