output "bastion_pub_ip" {
  value = module.instance_bastion.public_ip
}

output "bastion_pvt_ip" {
  value = module.instance_bastion.private_ip
}

output "vpn_pub_ip" {
  value = module.instance_vpn.public_ip
}

output "vpn_pvt_ip" {
  value = module.instance_vpn.private_ip
}