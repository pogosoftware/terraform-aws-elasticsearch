# Module: aws_elasticsearch_domain

Manages an AWS Elasticsearch Domain.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.14.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticsearch_domain.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticsearch_domain) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | IAM policy document specifying the access policies for the domain | `string` | `null` | no |
| <a name="input_advanced_options"></a> [advanced\_options](#input\_advanced\_options) | Key-value string pairs to specify advanced configuration options | `map(string)` | `{}` | no |
| <a name="input_advanced_security_options"></a> [advanced\_security\_options](#input\_advanced\_security\_options) | Configuration block for fine-grained access control | `map(any)` | `{}` | no |
| <a name="input_auto_tune_options"></a> [auto\_tune\_options](#input\_auto\_tune\_options) | Configuration block for the Auto-Tune options of the domain | `map(any)` | `{}` | no |
| <a name="input_cluster_config"></a> [cluster\_config](#input\_cluster\_config) | Configuration block for the cluster of the domain | `map(any)` | `{}` | no |
| <a name="input_cognito_options"></a> [cognito\_options](#input\_cognito\_options) | Configuration block for authenticating Kibana with Cognito | `map(any)` | `{}` | no |
| <a name="input_domain_endpoint_options"></a> [domain\_endpoint\_options](#input\_domain\_endpoint\_options) | Configuration block for domain endpoint HTTP(S) related options | `map(any)` | `{}` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Name of the domain | `string` | n/a | yes |
| <a name="input_ebs_options"></a> [ebs\_options](#input\_ebs\_options) | Configuration block for EBS related options, may be required based on chosen instance size | `map(any)` | `{}` | no |
| <a name="input_elasticsearch_version"></a> [elasticsearch\_version](#input\_elasticsearch\_version) | Version of Elasticsearch to deploy. Defaults to `1.5` | `string` | `"1.5"` | no |
| <a name="input_encrypt_at_rest"></a> [encrypt\_at\_rest](#input\_encrypt\_at\_rest) | Configuration block for encrypt at rest options. Only available for certain instance types | `map(any)` | `{}` | no |
| <a name="input_log_publishing_options"></a> [log\_publishing\_options](#input\_log\_publishing\_options) | Configuration block for publishing slow and application logs to CloudWatch Logs | `map(any)` | `{}` | no |
| <a name="input_node_to_node_encryption"></a> [node\_to\_node\_encryption](#input\_node\_to\_node\_encryption) | Configuration block for node-to-node encryption options | `map(any)` | `{}` | no |
| <a name="input_snapshot_options"></a> [snapshot\_options](#input\_snapshot\_options) | Configuration block for snapshot related options | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_vpc_options"></a> [vpc\_options](#input\_vpc\_options) | Configuration block for VPC related options | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the domain |
| <a name="output_domain_id"></a> [domain\_id](#output\_domain\_id) | Unique identifier for the domain |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | Name of the Elasticsearch domain |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Domain-specific endpoint used to submit index, search, and data upload requests |
| <a name="output_kibana_endpoint"></a> [kibana\_endpoint](#output\_kibana\_endpoint) | Domain-specific endpoint for kibana without https scheme |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->