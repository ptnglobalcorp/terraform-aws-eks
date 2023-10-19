<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_eks"></a> [aws\_eks](#module\_aws\_eks) | ../.. | n/a |
| <a name="module_aws_vpc"></a> [aws\_vpc](#module\_aws\_vpc) | terraform-aws-modules/vpc/aws | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | The type of capacity to provision for the EBS volume. | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The Kubernetes version to use for the EKS cluster. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment (e.g. dev, prod). | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The EC2 instance type to use for the worker nodes. | `string` | n/a | yes |
| <a name="input_iops"></a> [iops](#input\_iops) | The number of IOPS to provision for the EBS volume. | `any` | n/a | yes |
| <a name="input_node_desired_size"></a> [node\_desired\_size](#input\_node\_desired\_size) | The desired number of worker nodes for the EKS cluster. | `any` | n/a | yes |
| <a name="input_node_max_size"></a> [node\_max\_size](#input\_node\_max\_size) | The maximum number of worker nodes for the EKS cluster. | `any` | n/a | yes |
| <a name="input_node_min_size"></a> [node\_min\_size](#input\_node\_min\_size) | The minimum number of worker nodes for the EKS cluster. | `any` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | A prefix to use for naming resources in the environment. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The name of the project this infrastructure is being created for. | `string` | n/a | yes |
| <a name="input_region_code"></a> [region\_code](#input\_region\_code) | The AWS region code where the infrastructure will be created. | `string` | n/a | yes |
| <a name="input_throughput"></a> [throughput](#input\_throughput) | The throughput to provision for the EBS volume. | `any` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The size of the EBS volume to attach to each worker node. | `any` | n/a | yes |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | The type of EBS volume to attach to each worker node. | `string` | n/a | yes |
| <a name="input_whitelist_ips"></a> [whitelist\_ips](#input\_whitelist\_ips) | n/a | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->