locals {
  cluster_endpoint_public_access_cidrs = [for ip in var.whitelist_ips : "${ip}/32"]

  subnet_ids = [element(var.vpc.private_subnets, 0), element(var.vpc.private_subnets, 1), element(var.vpc.private_subnets, 2)]

  eks_managed_node_groups = {
    for idx, subnet_id in local.subnet_ids :
    "eks-node-group-${idx}" => {
      name                            = "${var.prefix}-${var.project}-${var.environment}-eks-${var.region_code}-node"
      iam_role_use_name_prefix        = false
      iam_role_name                   = "${var.prefix}-${var.project}-${var.environment}-iam-roles-${var.region_code}-eks-node-group-${idx}"
      subnet_ids                      = ["${subnet_id}"]
      launch_template_use_name_prefix = true
      iam_role_use_name_prefix        = false
      max_size                        = var.node_max_size
      min_size                        = var.node_min_size
      desired_size                    = var.node_desired_size
      key_name                        = module.key_pair.key_pair_name
      capacity_type                   = var.capacity_type
      instance_type                   = [var.instance_type]
      vpc_security_group_ids          = [var.addition_sg_node]
      block_device_mappings = {
        xvda = {
          device_name = "/dev/xvda"
          ebs = {
            volume_size           = var.volume_size
            volume_type           = var.volume_type
            iops                  = var.iops
            throughput            = var.throughput
            encrypted             = true
            delete_on_termination = true
          }
        }
      }

     
    }
  }
}

module "key_pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "~> 2.0"

  key_name_prefix    = "${var.prefix}-${var.project}-${var.environment}-keypair-${var.region_code}"
  create_private_key = true

  
}

module "aws_eks" {
  source = "terraform-aws-modules/eks/aws"

  vpc_id     = var.vpc.vpc_id
  subnet_ids = local.subnet_ids

  cluster_name                    = "${var.prefix}-${var.project}-${var.environment}-eks-${var.region_code}-cluster"
  cluster_version                 = var.cluster_version
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  iam_role_use_name_prefix = false

  kms_key_enable_default_policy = true

  cluster_endpoint_public_access_cidrs = local.cluster_endpoint_public_access_cidrs

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
    aws-ebs-csi-driver = {
      service_account_role_arn = "${aws_iam_role.aws_ebs_csi_driverrole.arn}"
      resolve_conflicts        = "OVERWRITE"
    }
  }

  cluster_enabled_log_types = ["audit", "api", "authenticator"]

  eks_managed_node_group_defaults = {
    instance_types = [var.instance_type]
  }

  eks_managed_node_groups = local.eks_managed_node_groups

  node_security_group_id = var.addition_sg_node

  
}

## IAM ROLES for EBS CSI Driver add-ons 
data "aws_kms_key" "kms_ebs" {
  key_id = "alias/aws/ebs"
}

data "aws_iam_policy" "ebscsi_driver_policy" {
  name = "AmazonEBSCSIDriverPolicy"
}

resource "aws_iam_role_policy_attachment" "aws_ebs_csi_driverrole_ebscsi_driver_policy" {
  role       = aws_iam_role.aws_ebs_csi_driverrole.name
  policy_arn = data.aws_iam_policy.ebscsi_driver_policy.arn
}

resource "aws_iam_role_policy" "kms_key_for_encryption_on_ebs_policy" {
  name = "${var.prefix}-${var.project}-${var.environment}-iam-role-${var.region_code}-kms-key-for-encryption-on-ebs"
  role = aws_iam_role.aws_ebs_csi_driverrole.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "kms:CreateGrant",
          "kms:ListGrants",
          "kms:RevokeGrant"
        ],
        "Resource" : [
          "${data.aws_kms_key.kms_ebs.arn}"
        ],
        "Condition" : {
          "Bool" : {
            "kms:GrantIsForAWSResource" : "true"
          }
        }
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ],
        "Resource" : [
          "${data.aws_kms_key.kms_ebs.arn}"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "aws_ebs_csi_driverrole" {
  name = "${var.prefix}-${var.project}-${var.environment}-iam-role-${var.region_code}-eks-ebs-csi-driverrole"
  depends_on = [
    module.aws_eks.oidc_provider_arn
  ]
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "${module.aws_eks.oidc_provider_arn}"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringEquals" : {
            "${module.aws_eks.oidc_provider}:aud" : "sts.amazonaws.com",
            "${module.aws_eks.oidc_provider}:sub" : "system:serviceaccount:kube-system:ebs-csi-controller-sa"
          }
        }
      }
    ]
  })
}

data "aws_eks_cluster_auth" "default" {
  name = module.aws_eks.cluster_name
}