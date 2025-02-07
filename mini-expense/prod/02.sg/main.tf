locals {
  vpc_id = data.aws_ssm_parameter.mini_vpc.value
}


module "bastion" {
  source         = "../../../my-module/sg"
  envirnoment    = var.envirnoment
  project-name   = var.project-name
  sg_description = "This sg is used for bastion"
  vpc_id         = local.vpc_id
  common_tags    = var.common_tags
  sg_name        = "bastion"
}

module "vpn" {
  source         = "../../../my-module/sg"
  envirnoment    = var.envirnoment
  project-name   = var.project-name
  sg_description = "This sg is used for vpn"
  vpc_id         = local.vpc_id
  common_tags    = var.common_tags
  sg_name        = "vpn"

}

module "external_lb" {
  source         = "../../../my-module/sg"
  envirnoment    = var.envirnoment
  project-name   = var.project-name
  sg_description = "This sg is used for external_lb"
  vpc_id         = local.vpc_id
  common_tags    = var.common_tags
  sg_name        = "external_lb"
}

module "internal_lb" {
  source         = "../../../my-module/sg"
  envirnoment    = var.envirnoment
  project-name   = var.project-name
  sg_description = "This sg is used for internal_lb"
  vpc_id         = local.vpc_id
  common_tags    = var.common_tags
  sg_name        = "internal_lb"
}

module "backend" {
  source         = "../../../my-module/sg"
  envirnoment    = var.envirnoment
  project-name   = var.project-name
  sg_description = "This sg is used for backend"
  vpc_id         = local.vpc_id
  common_tags    = var.common_tags
  sg_name        = "backend"
}

module "frontend" {
  source         = "../../../my-module/sg"
  envirnoment    = var.envirnoment
  project-name   = var.project-name
  sg_description = "This sg is used for frontend"
  vpc_id         = local.vpc_id
  common_tags    = var.common_tags
  sg_name        = "frontend"
}

module "db" {
  source         = "../../../my-module/sg"
  envirnoment    = var.envirnoment
  project-name   = var.project-name
  sg_description = "This sg is used for db"
  vpc_id         = local.vpc_id
  common_tags    = var.common_tags
  sg_name        = "db"
}


#db rules
resource "aws_security_group_rule" "bastion_db" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id        = module.db.sg_id
}


resource "aws_security_group_rule" "vpn_db" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.vpn.sg_id
  security_group_id        = module.db.sg_id
}


resource "aws_security_group_rule" "backend_db" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = module.backend.sg_id
  security_group_id        = module.db.sg_id
}


#backend rules

resource "aws_security_group_rule" "bastion_backend" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id        = module.backend.sg_id
}



resource "aws_security_group_rule" "vpn_backend" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.vpn.sg_id
  security_group_id        = module.backend.sg_id
}



resource "aws_security_group_rule" "internal_lb_backend" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = module.internal_lb.sg_id
  security_group_id        = module.backend.sg_id
}


#internal-lb

resource "aws_security_group_rule" "bastion_internal_lb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id        = module.internal_lb.sg_id
}


resource "aws_security_group_rule" "vpn_internal_lb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.vpn.sg_id
  security_group_id        = module.internal_lb.sg_id
}

resource "aws_security_group_rule" "frontend_internal_lb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.frontend.sg_id
  security_group_id        = module.internal_lb.sg_id
}


#frontend
resource "aws_security_group_rule" "bastion_frontend" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.bastion.sg_id
  security_group_id        = module.frontend.sg_id
}

resource "aws_security_group_rule" "vpn_frontend" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.vpn.sg_id
  security_group_id        = module.frontend.sg_id
}

resource "aws_security_group_rule" "external_lb_frontend" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = module.external_lb.sg_id
  security_group_id        = module.frontend.sg_id
}

# bastion rules

resource "aws_security_group_rule" "anywhere_bastion" {
  description       = "allow traffic from 22 from anywhere"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}


#external-lb rules

resource "aws_security_group_rule" "anywhere_http_external_lb" {
  description       = "allow traffic from 80 from anywhere"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.external_lb.sg_id
}

resource "aws_security_group_rule" "anywhere_https_external_lb" {
  description       = "allow traffic form 443 from anywhere"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.external_lb.sg_id
}

# vpn rules
resource "aws_security_group_rule" "vpn_ssh" {
  description       = "This rule allows all traffic from internet on 22"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_https" {
  description       = "This rule allows all traffic from internet on 443"
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_et" {
  description       = "This rule allows all traffic from internet on 943"
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_udp" {
  description       = "This rule allows all traffic from internet on 114"
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}



