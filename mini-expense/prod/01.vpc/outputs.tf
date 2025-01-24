output "mini_vpc_id" {
  value = module.mini_vpc.vpc_id
}

output "pub_sub_ids" {
  value = module.mini_vpc.pub-sub-id
}


output "pvt_sub_ids" {
  value = module.mini_vpc.pvt-sub-id
}

output "db_sub_ids" {
  value = module.mini_vpc.db-sub-id

}

output "db_subnet_group" {
  value = module.mini_vpc.db_subnet_group_name

}