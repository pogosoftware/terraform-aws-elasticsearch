##########################################################################
### REQUIRED
##########################################################################
variable "domain_name" {
  description = "Name of the domain"
  type        = string
}

##########################################################################
### OPTIONAL
##########################################################################
variable "access_policies" {
  default     = null
  description = "IAM policy document specifying the access policies for the domain"
  type        = string
}

variable "advanced_options" {
  default     = {}
  description = "Key-value string pairs to specify advanced configuration options"
  type        = map(string)
}

variable "advanced_security_options" {
  default     = {}
  description = "Configuration block for fine-grained access control"
  type        = map(any)
}

variable "auto_tune_options" {
  default     = {}
  description = "Configuration block for the Auto-Tune options of the domain"
  type        = map(any)
}

variable "cluster_config" {
  default     = {}
  description = "Configuration block for the cluster of the domain"
  type        = map(any)
}

variable "cognito_options" {
  default     = {}
  description = "Configuration block for authenticating Kibana with Cognito"
  type        = map(any)
}

variable "domain_endpoint_options" {
  default     = {}
  description = "Configuration block for domain endpoint HTTP(S) related options"
  type        = map(any)
}

variable "ebs_options" {
  default     = {}
  description = "Configuration block for EBS related options, may be required based on chosen instance size"
  type        = map(any)
}

variable "elasticsearch_version" {
  default     = "1.5"
  description = "Version of Elasticsearch to deploy. Defaults to `1.5`"
  type        = string
}

variable "encrypt_at_rest" {
  default     = {}
  description = "Configuration block for encrypt at rest options. Only available for certain instance types"
  type        = map(any)
}

variable "log_publishing_options" {
  default     = {}
  description = "Configuration block for publishing slow and application logs to CloudWatch Logs"
  type        = map(any)
}

variable "node_to_node_encryption" {
  default     = {}
  description = "Configuration block for node-to-node encryption options"
  type        = map(any)
}

variable "snapshot_options" {
  default     = {}
  description = "Configuration block for snapshot related options"
  type        = map(any)
}

variable "tags" {
  default     = {}
  description = "Map of tags to assign to the resource"
  type        = map(string)
}

variable "vpc_options" {
  default     = {}
  description = "Configuration block for VPC related options"
  type        = map(any)
}
