output "iam_service_linked_roles" {
  description = "The IAM service linked roles"
  value       = { for k, v in var.iam_service_linked_roles : k => module.iam_service_linked_role[k] }
}
