data "aws_ssm_parameter" "bastion_sg" {
  name = "${var.envirnoment}-${var.project-name}-bastion-sg"
}

data "aws_ssm_parameter" "vpn_sg" {
  name = "${var.envirnoment}-${var.project-name}-vpn-sg"
}

data "aws_ssm_parameter" "pub_sub_ids" {
  name = "/${var.envirnoment}/${var.project-name}/pub-sub"
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_ami" "opnevpn" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["OpenVPN Access Server Community Image-fe8020db-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


