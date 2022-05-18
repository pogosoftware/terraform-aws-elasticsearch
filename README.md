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
| <a name="module_iam_service_linked_role"></a> [iam\_service\_linked\_role](#module\_iam\_service\_linked\_role) | ./modules/iam_service_linked_role | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_service_linked_roles"></a> [iam\_service\_linked\_roles](#input\_iam\_service\_linked\_roles) | The IAM Service linked roles where `aws_service_name` is a key | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_service_linked_roles"></a> [iam\_service\_linked\_roles](#output\_iam\_service\_linked\_roles) | The IAM service linked roles |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->