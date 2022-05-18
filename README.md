# terraform-aws-elasticsearch

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_elasticsearch_domain"></a> [elasticsearch\_domain](#module\_elasticsearch\_domain) | ./modules/elasticsearch_domain | n/a |
| <a name="module_iam_service_linked_role"></a> [iam\_service\_linked\_role](#module\_iam\_service\_linked\_role) | ./modules/iam_service_linked_role | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_elasticsearch_domain"></a> [create\_elasticsearch\_domain](#input\_create\_elasticsearch\_domain) | Determinator to create `elasticseach_domain` resources or not | `bool` | `true` | no |
| <a name="input_elasticsearch_domain_access_policies"></a> [elasticsearch\_domain\_access\_policies](#input\_elasticsearch\_domain\_access\_policies) | IAM policy document specifying the access policies for the domain | `string` | `null` | no |
| <a name="input_elasticsearch_domain_advanced_options"></a> [elasticsearch\_domain\_advanced\_options](#input\_elasticsearch\_domain\_advanced\_options) | Key-value string pairs to specify advanced configuration options | `map(string)` | `{}` | no |
| <a name="input_elasticsearch_domain_advanced_security_options"></a> [elasticsearch\_domain\_advanced\_security\_options](#input\_elasticsearch\_domain\_advanced\_security\_options) | Configuration block for fine-grained access control | `map(any)` | `{}` | no |
| <a name="input_elasticsearch_domain_auto_tune_options"></a> [elasticsearch\_domain\_auto\_tune\_options](#input\_elasticsearch\_domain\_auto\_tune\_options) | Configuration block for the Auto-Tune options of the domain | `map(any)` | `{}` | no |
| <a name="input_elasticsearch_domain_cluster_config"></a> [elasticsearch\_domain\_cluster\_config](#input\_elasticsearch\_domain\_cluster\_config) | Configuration block for the cluster of the domain | `map(any)` | `{}` | no |
| <a name="input_elasticsearch_domain_cognito_options"></a> [elasticsearch\_domain\_cognito\_options](#input\_elasticsearch\_domain\_cognito\_options) | Configuration block for authenticating Kibana with Cognito | `map(any)` | `{}` | no |
| <a name="input_elasticsearch_domain_ebs_options"></a> [elasticsearch\_domain\_ebs\_options](#input\_elasticsearch\_domain\_ebs\_options) | Configuration block for EBS related options, may be required based on chosen instance size | `map(any)` | `{}` | no |
| <a name="input_elasticsearch_domain_encrypt_at_rest"></a> [elasticsearch\_domain\_encrypt\_at\_rest](#input\_elasticsearch\_domain\_encrypt\_at\_rest) | Configuration block for encrypt at rest options. Only available for certain instance types | `map(any)` | `{}` | no |
| <a name="input_elasticsearch_domain_endpoint_options"></a> [elasticsearch\_domain\_endpoint\_options](#input\_elasticsearch\_domain\_endpoint\_options) | Configuration block for domain endpoint HTTP(S) related options | `map(any)` | `{}` | no |
| <a name="input_elasticsearch_domain_log_publishing_options"></a> [elasticsearch\_domain\_log\_publishing\_options](#input\_elasticsearch\_domain\_log\_publishing\_options) | Configuration block for publishing slow and application logs to CloudWatch Logs | `map(any)` | `{}` | no |
| <a name="input_elasticsearch_domain_name"></a> [elasticsearch\_domain\_name](#input\_elasticsearch\_domain\_name) | Required if `create_elasticsearch_domain` is set to `true`. Name of the domain | `string` | n/a | yes |
| <a name="input_elasticsearch_domain_node_to_node_encryption"></a> [elasticsearch\_domain\_node\_to\_node\_encryption](#input\_elasticsearch\_domain\_node\_to\_node\_encryption) | Configuration block for node-to-node encryption options | `map(any)` | `{}` | no |
| <a name="input_elasticsearch_domain_snapshot_options"></a> [elasticsearch\_domain\_snapshot\_options](#input\_elasticsearch\_domain\_snapshot\_options) | Configuration block for snapshot related options | `map(any)` | `{}` | no |
| <a name="input_elasticsearch_domain_tags"></a> [elasticsearch\_domain\_tags](#input\_elasticsearch\_domain\_tags) | Map of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_elasticsearch_domain_version"></a> [elasticsearch\_domain\_version](#input\_elasticsearch\_domain\_version) | Version of Elasticsearch to deploy. Defaults to `1.5` | `string` | `"1.5"` | no |
| <a name="input_elasticsearch_domain_vpc_options"></a> [elasticsearch\_domain\_vpc\_options](#input\_elasticsearch\_domain\_vpc\_options) | Configuration block for VPC related options | `map(any)` | `{}` | no |
| <a name="input_iam_service_linked_roles"></a> [iam\_service\_linked\_roles](#input\_iam\_service\_linked\_roles) | The IAM Service linked roles where `aws_service_name` is a key | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticsearch_domain_arn"></a> [elasticsearch\_domain\_arn](#output\_elasticsearch\_domain\_arn) | ARN of the domain |
| <a name="output_elasticsearch_domain_endpoint"></a> [elasticsearch\_domain\_endpoint](#output\_elasticsearch\_domain\_endpoint) | Domain-specific endpoint used to submit index, search, and data upload requests |
| <a name="output_elasticsearch_domain_id"></a> [elasticsearch\_domain\_id](#output\_elasticsearch\_domain\_id) | Unique identifier for the domain |
| <a name="output_elasticsearch_domain_kibana_endpoint"></a> [elasticsearch\_domain\_kibana\_endpoint](#output\_elasticsearch\_domain\_kibana\_endpoint) | Domain-specific endpoint for kibana without https scheme |
| <a name="output_elasticsearch_domain_name"></a> [elasticsearch\_domain\_name](#output\_elasticsearch\_domain\_name) | Name of the Elasticsearch domain |
| <a name="output_iam_service_linked_roles"></a> [iam\_service\_linked\_roles](#output\_iam\_service\_linked\_roles) | The IAM service linked roles |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->