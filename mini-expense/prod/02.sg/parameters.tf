resource "aws_ssm_parameter" "bastion" {
  name  = "${var.envirnoment}-${var.project-name}-bastion-sg"
  type  = "String"
  value = module.bastion.sg_id
}

resource "aws_ssm_parameter" "vpn" {
  name  = "${var.envirnoment}-${var.project-name}-vpn-sg"
  type  = "String"
  value = module.vpn.sg_id
}

resource "aws_ssm_parameter" "external_lb" {
  name  = "${var.envirnoment}-${var.project-name}-external-sg"
  type  = "String"
  value = module.external_lb.sg_id
}

resource "aws_ssm_parameter" "internal_lb" {
  name  = "${var.envirnoment}-${var.project-name}-internal-sg"
  type  = "String"
  value = module.internal_lb.sg_id
}

resource "aws_ssm_parameter" "backend" {
  name  = "${var.envirnoment}-${var.project-name}-backend-sg"
  type  = "String"
  value = module.backend.sg_id
}

resource "aws_ssm_parameter" "db" {
  name  = "${var.envirnoment}-${var.project-name}-db-sg"
  type  = "String"
  value = module.db.sg_id
}

resource "aws_ssm_parameter" "frontend" {
  name  = "${var.envirnoment}-${var.project-name}-frontend-sg"
  type  = "String"
  value = module.frontend.sg_id
}

