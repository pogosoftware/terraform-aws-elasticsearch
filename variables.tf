##########################################################################
### IAM SERVICE LINKED ROLE
##########################################################################
variable "iam_service_linked_roles" {
  default     = {}
  description = "The IAM Service linked roles where `aws_service_name` is a key"
  type        = any
}

##########################################################################
### ELASTICSEARCH DOMAIN
##########################################################################
variable "create_elasticsearch_domain" {
  default     = true
  description = "Determinator to create `elasticseach_domain` resources or not"
  type        = bool
}

variable "elasticsearch_domain_name" {
  default     = null
  description = "Required if `create_elasticsearch_domain` is set to `true`. Name of the domain"
  type        = string
}

variable "elasticsearch_domain_access_policies" {
  default     = null
  description = "IAM policy document specifying the access policies for the domain"
  type        = string
}

variable "elasticsearch_domain_advanced_options" {
  default     = {}
  description = "Key-value string pairs to specify advanced configuration options"
  type        = map(string)
}

variable "elasticsearch_domain_advanced_security_options" {
  default     = {}
  description = "Configuration block for fine-grained access control"
  type        = any
}

variable "elasticsearch_domain_auto_tune_options" {
  default     = {}
  description = "Configuration block for the Auto-Tune options of the domain"
  type        = any
}

variable "elasticsearch_domain_cluster_config" {
  default     = {}
  description = "Configuration block for the cluster of the domain"
  type        = any
}

variable "elasticsearch_domain_cognito_options" {
  default     = {}
  description = "Configuration block for authenticating Kibana with Cognito"
  type        = any
}

variable "elasticsearch_domain_endpoint_options" {
  default     = {}
  description = "Configuration block for domain endpoint HTTP(S) related options"
  type        = any
}

variable "elasticsearch_domain_ebs_options" {
  default     = {}
  description = "Configuration block for EBS related options, may be required based on chosen instance size"
  type        = any
}

variable "elasticsearch_domain_version" {
  default     = "1.5"
  description = "Version of Elasticsearch to deploy. Defaults to `1.5`"
  type        = string
}

variable "elasticsearch_domain_encrypt_at_rest" {
  default     = {}
  description = "Configuration block for encrypt at rest options. Only available for certain instance types"
  type        = any
}

variable "elasticsearch_domain_log_publishing_options" {
  default     = {}
  description = "Configuration block for publishing slow and application logs to CloudWatch Logs"
  type        = any
}

variable "elasticsearch_domain_node_to_node_encryption" {
  default     = {}
  description = "Configuration block for node-to-node encryption options"
  type        = any
}

variable "elasticsearch_domain_snapshot_options" {
  default     = {}
  description = "Configuration block for snapshot related options"
  type        = any
}

variable "elasticsearch_domain_tags" {
  default     = {}
  description = "Map of tags to assign to the resource"
  type        = map(string)
}

variable "elasticsearch_domain_vpc_options" {
  default     = {}
  description = "Configuration block for VPC related options"
  type        = any
}
