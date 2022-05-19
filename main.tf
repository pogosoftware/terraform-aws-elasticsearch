module "iam_service_linked_role" {
  source = "./modules/iam_service_linked_role"

  for_each = var.iam_service_linked_roles

  aws_service_name = each.key
  custom_suffix    = lookup(each.value, "custom_suffix", null)
  description      = lookup(each.value, "description", null)
  tags             = lookup(each.value, "tags", null)
}

module "elasticsearch_domain" {
  source = "./modules/elasticsearch_domain"

  count = var.create_elasticsearch_domain ? 1 : 0

  domain_name               = var.elasticsearch_domain_name
  access_policies           = var.elasticsearch_domain_access_policies
  advanced_options          = var.elasticsearch_domain_advanced_options
  elasticsearch_version     = var.elasticsearch_domain_version
  tags                      = var.elasticsearch_domain_tags
  advanced_security_options = var.elasticsearch_domain_advanced_security_options
  auto_tune_options         = var.elasticsearch_domain_auto_tune_options
  cluster_config            = var.elasticsearch_domain_cluster_config
  cognito_options           = var.elasticsearch_domain_cognito_options
  domain_endpoint_options   = var.elasticsearch_domain_endpoint_options
  ebs_options               = var.elasticsearch_domain_ebs_options
  encrypt_at_rest           = var.elasticsearch_domain_encrypt_at_rest
  log_publishing_options    = var.elasticsearch_domain_log_publishing_options
  node_to_node_encryption   = var.elasticsearch_domain_node_to_node_encryption
  snapshot_options          = var.elasticsearch_domain_snapshot_options
  vpc_options               = var.elasticsearch_domain_vpc_options
}
