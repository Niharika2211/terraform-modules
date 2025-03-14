locals {
  name = "${var.envirnoment}-${var.project_name}-${var.instance_name}"
}

resource "aws_instance" "vm" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.vpc_security_group_ids

    tags = merge(
    {
      Name = local.name
    },
    var.common_tags
  )
}