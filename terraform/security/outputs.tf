output "security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "db_security_group_id" {
  value = aws_security_group.rds_sg.id
}

output "ec2_role_name" {
  value = aws_iam_role.ec2_role.name
}