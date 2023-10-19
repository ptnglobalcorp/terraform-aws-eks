<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.9 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.47 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_eks"></a> [aws\_eks](#module\_aws\_eks) | terraform-aws-modules/eks/aws | n/a |
| <a name="module_key_pair"></a> [key\_pair](#module\_key\_pair) | terraform-aws-modules/key-pair/aws | ~> 2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.aws_ebs_csi_driverrole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.kms_key_for_encryption_on_ebs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.aws_ebs_csi_driverrole_ebscsi_driver_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_eks_cluster_auth.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy.ebscsi_driver_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_kms_key.kms_ebs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addition_sg_node"></a> [addition\_sg\_node](#input\_addition\_sg\_node) | The ID of the security group to associate with the worker nodes. | `string` | `""` | no |
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
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to the resources created. | `any` | n/a | yes |
| <a name="input_throughput"></a> [throughput](#input\_throughput) | The throughput to provision for the EBS volume. | `any` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The size of the EBS volume to attach to each worker node. | `any` | n/a | yes |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | The type of EBS volume to attach to each worker node. | `string` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | The VPC ID or VPC configuration for the EKS cluster. | `any` | n/a | yes |
| <a name="input_whitelist_ips"></a> [whitelist\_ips](#input\_whitelist\_ips) | n/a | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_eks_cluster_auth_token"></a> [aws\_eks\_cluster\_auth\_token](#output\_aws\_eks\_cluster\_auth\_token) | n/a |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The unique identifier of the AWS EKS cluster. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the AWS EKS cluster. |
| <a name="output_cluster_tls_certificate_sha1_fingerprint"></a> [cluster\_tls\_certificate\_sha1\_fingerprint](#output\_cluster\_tls\_certificate\_sha1\_fingerprint) | n/a |
| <a name="output_eks_cluster_certificate_authority_data"></a> [eks\_cluster\_certificate\_authority\_data](#output\_eks\_cluster\_certificate\_authority\_data) | The base64-encoded certificate data required to communicate securely with the Kubernetes API server of the AWS EKS cluster. |
| <a name="output_eks_cluster_endpoint"></a> [eks\_cluster\_endpoint](#output\_eks\_cluster\_endpoint) | The endpoint URL for the Kubernetes API server of the AWS EKS cluster. |
| <a name="output_eks_managed_node_groups_autoscaling_group_names"></a> [eks\_managed\_node\_groups\_autoscaling\_group\_names](#output\_eks\_managed\_node\_groups\_autoscaling\_group\_names) | The names of the Auto Scaling groups associated with the managed node groups in the AWS EKS cluster. |
| <a name="output_eks_oidc_provider_arn"></a> [eks\_oidc\_provider\_arn](#output\_eks\_oidc\_provider\_arn) | n/a |
<!-- END_TF_DOCS -->