# Module: aws_iam_service_linked_role
Provides an [IAM service-linked role.](https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html)

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
| [aws_iam_service_linked_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_service_name"></a> [aws\_service\_name](#input\_aws\_service\_name) | The AWS service to which this role is attached | `string` | n/a | yes |
| <a name="input_custom_suffix"></a> [custom\_suffix](#input\_custom\_suffix) | Additional string appended to the role name | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the role | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value mapping of tags for the IAM role | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) specifying the role |
| <a name="output_id"></a> [id](#output\_id) | The Amazon Resource Name (ARN) of the role |
| <a name="output_name"></a> [name](#output\_name) | The name of the role |
| <a name="output_path"></a> [path](#output\_path) | The path of the role |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->