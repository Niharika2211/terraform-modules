module "asg_backend" {
  source       = "../../../my-module/auto-sclng-grp"
  envirnoment  = var.envirnoment
  project_name = var.project_name
  common_tags = {
    Terraform   = "true"
    Author      = "Niha bapatla"
    Component   = "asg-backend"
    Project     = "Expense"
    envirnoment = "PROD"
  }
  ami_id                    = data.aws_ami.backend.id
  instance_type             = var.instance_type
  key_name                  = var.key_name
  vpc_security_group_ids    = [data.aws_ssm_parameter.backend.value]
  port                      = 8080
  health_check_path         = "/health"
  vpc_id                    = data.aws_ssm_parameter.mini_vpc.value
  asg_max_size              = 2
  asg_min_size              = 1
  desired_capacity          = 2
  health_check_grace_period = 90
  subnets                   = split(",", data.aws_ssm_parameter.pvt_sub_ids.value)
  target_value              = 10
  listener_arn              = data.aws_ssm_parameter.internal_http_listner.value
  component                 = "internal"
  zone_name                 = var.zone_name

}

module "asg_frontend" {
  source       = "../../../my-module/auto-sclng-grp"
  envirnoment  = var.envirnoment
  project_name = var.project_name
  common_tags = {
    Terraform   = "true"
    Author      = "Niha bapatla"
    Component   = "asg-frontend"
    Project     = "Expense"
    envirnoment = "PROD"
  }
  ami_id                    = data.aws_ami.frontend.id
  instance_type             = var.instance_type
  key_name                  = var.key_name
  vpc_security_group_ids    = [data.aws_ssm_parameter.frontend.value]
  port                      = 80
  health_check_path         = "/health"
  vpc_id                    = data.aws_ssm_parameter.mini_vpc.value
  asg_max_size              = 2
  asg_min_size              = 1
  desired_capacity          = 2
  health_check_grace_period = 80
  subnets                   = split(",", data.aws_ssm_parameter.pvt_sub_ids.value)
  target_value              = 10
  listener_arn              = data.aws_ssm_parameter.external_https_listner.value
  component                 = "external"
  zone_name                 = var.zone_name

}
