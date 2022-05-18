##########################################################################
### IAM SERVICE LINKED ROLE
##########################################################################
variable "iam_service_linked_roles" {
  default     = {}
  description = "The IAM Service linked roles where `aws_service_name` is a key"
  type        = map(any)
}
