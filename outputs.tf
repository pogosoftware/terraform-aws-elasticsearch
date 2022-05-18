##########################################################################
### IAM SERVICE LINKED ROLE
##########################################################################
output "iam_service_linked_roles" {
  description = "The IAM service linked roles"
  value       = { for k, v in var.iam_service_linked_roles : k => module.iam_service_linked_role[k] }
}

##########################################################################
### ELASTICSEARCH DOMAIN
##########################################################################
output "elasticsearch_domain_arn" {
  description = "ARN of the domain"
  value       = try(module.elasticsearch_domain[0].this.arn, "")
}

output "elasticsearch_domain_id" {
  description = "Unique identifier for the domain"
  value       = try(module.elasticsearch_domain[0].this.domain_id, "")
}

output "elasticsearch_domain_name" {
  description = "Name of the Elasticsearch domain"
  value       = try(module.elasticsearch_domain[0].this.domain_name, "")
}

output "elasticsearch_domain_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
  value       = try(module.elasticsearch_domain[0].this.endpoint, "")
}

output "elasticsearch_domain_kibana_endpoint" {
  description = "Domain-specific endpoint for kibana without https scheme"
  value       = try(module.elasticsearch_domain[0].this._kibana_endpoint, "")
}
