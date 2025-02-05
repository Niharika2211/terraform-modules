locals {
  bastion_sg  = data.aws_ssm_parameter.bastion_sg.value
  vpn_sg      = data.aws_ssm_parameter.vpn_sg.value
  amazon_ami  = data.aws_ami.amazon_linux.id
  opnevpn_ami = data.aws_ami.opnevpn.id
  pub_sub_ids = element(split(",", data.aws_ssm_parameter.pub_sub_ids.value), 0)
}

module "instance_bastion" {
  source                 = "../../../my-module/ec2"
  envirnoment            = var.envirnoment
  project_name           = var.project-name
  ami                    = local.amazon_ami
  instance_name          = "bastion"
  instance_type          = "t3.micro"
  key_name               = var.key_name
  subnet_id              = local.pub_sub_ids
  vpc_security_group_ids = [local.bastion_sg]
  common_tags = {
    Terraform   = "true"
    Author      = "Niha bapatla"
    Component   = "bastion"
    Project     = "Expense"
    envirnoment = "PROD"
  }

}

module "instance_vpn" {
  source                 = "../../../my-module/ec2"
  envirnoment            = var.envirnoment
  project_name           = var.project-name
  ami                    = local.opnevpn_ami
  instance_name          = "vpn"
  instance_type          = "t3a.small"
  key_name               = var.key_name
  subnet_id              = local.pub_sub_ids
  vpc_security_group_ids = [local.vpn_sg]
  common_tags = {
    Terraform   = "true"
    Author      = "Niha bapatla"
    Component   = "vpn"
    Project     = "Expense"
    envirnoment = "PROD"
  }

}
