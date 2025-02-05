locals {
  external_alb = "external"
  internal_alb = "internal"
}


module "acm_external" {
  source       = "../../../my-module/acm"
  envirnoment  = var.envirnoment
  project_name = var.project_name
  common_tags = {
    Terraform   = "true"
    Author      = "Niha bapatla"
    Component   = "acm"
    Project     = "Expense"
    envirnoment = "PROD"
  }
  component = local.external_alb
  zone_id   = var.zone_id
  zone_name = "nirvanan.online"

}

module "expense_internal" {
  source = "../../../my-module/lb"
  common_tags = {
    Terraform   = "true"
    Author      = "Niha bapatla"
    Component   = "internal"
    Project     = "Expense"
    envirnoment = "PROD"
  }
  environment                = var.envirnoment
  project_name               = var.project_name
  internal_external          = true
  lb_type                    = "application"
  alb_security_group         = [data.aws_ssm_parameter.internal_lb.value]
  alb_subnets                = split(",", data.aws_ssm_parameter.pvt_sub_ids.value)
  enable_deletion_protection = false
  create_http_listener       = true
  create_https_listener      = false
  zone_id                    = var.zone_id
  component                  = local.internal_alb
}

module "expense_external" {
  depends_on = [module.acm_external]
  source     = "../../../my-module/lb"
  common_tags = {
    Terraform   = "true"
    Author      = "Niha bapatla"
    Component   = "external"
    Project     = "Expense"
    envirnoment = "PROD"
  }
  environment                = var.envirnoment
  project_name               = var.project_name
  internal_external          = false
  lb_type                    = "application"
  alb_security_group         = [data.aws_ssm_parameter.external_lb.value]
  alb_subnets                = split(",", data.aws_ssm_parameter.pub_sub_ids.value)
  enable_deletion_protection = false
  create_http_listener       = true
  create_https_listener      = true
  certificate_arn            = module.acm_external.certificate_arn
  zone_id                    = var.zone_id
  component                  = local.external_alb
}