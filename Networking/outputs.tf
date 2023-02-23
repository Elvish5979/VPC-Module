output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.rds_subnet_group.*.name
}

output "db_security_group" {
  value = [aws_security_group.SGS["rds_sg"].id]
}

output "public_subnets" {
  value = aws_subnet.public_subnet.*.id
}

output "public_sgs" {
  value = aws_security_group.SGS["public"].id
}