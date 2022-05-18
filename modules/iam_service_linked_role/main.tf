resource "aws_iam_service_linked_role" "this" {
  aws_service_name = var.aws_service_name
  custom_suffix    = var.custom_suffix
  description      = var.description
  tags             = var.tags
}
