module "iam_service_linked_role" {
  source = "./modules/iam_service_linked_role"

  for_each = var.iam_service_linked_roles

  aws_service_name = each.key
  custom_suffix    = lookup(each.value, "custom_suffix", null)
  description      = lookup(each.value, "description", null)
  tags             = lookup(each.value, "tags", null)
}
