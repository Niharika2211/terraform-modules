output "vpc_id" {
  value = aws_vpc.new.id
}

output "vpc_arn" {
  value = aws_vpc.new.arn
}

output "pub-sub-id" {
  value = [for subnet in aws_subnet.pub-sub : subnet.id]

}

output "pvt-sub-id" {
  value = [for subnet in aws_subnet.pvt-sub : subnet.id]

}

output "db-sub-id" {
  value = [for subnet in aws_subnet.db-sub : subnet.id]

}

# output "default_vpc_id" {
#   value = data.aws_vpc.selected.id

# }

output "db_subnet_group_name" {
  value = aws_db_subnet_group.default.id
}