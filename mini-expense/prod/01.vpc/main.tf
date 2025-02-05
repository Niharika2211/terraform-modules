module "mini_vpc" {
  source                     = "../../../my-module/vpc"
  azs                        = ["us-east-1a", "us-east-1b"]
  vpc_cidr_rng               = "192.0.0.0/16"
  pub_sub_cidr               = ["192.0.1.0/24", "192.0.2.0/24"]
  pvt_sub_cidr               = ["192.0.3.0/24", "192.0.4.0/24"]
  db_sub_cidr                = ["192.0.5.0/24", "192.0.6.0/24"]
  enable_dns_hostnames       = "true"
  envirnoment                = var.envirnoment
  project-name               = var.project-name
  common_tags                = var.common_tags
  nat_enable                 = var.nat_enable
  aws_vpc_peering_connection = false

}

