output "id" {
  description = "The Amazon Resource Name (ARN) of the role"
  value       = aws_iam_service_linked_role.this.id
}

output "arn" {
  description = "The Amazon Resource Name (ARN) specifying the role"
  value       = aws_iam_service_linked_role.this.arn
}

output "name" {
  description = "The name of the role"
  value       = aws_iam_service_linked_role.this.name
}

output "path" {
  description = "The path of the role"
  value       = aws_iam_service_linked_role.this.name
}
