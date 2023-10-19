data "aws_availability_zones" "available" {}

locals {
  name            = "ex-${replace(basename(path.cwd), "_", "-")}"
  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  tags = "test"
}


module "aws_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]
  intra_subnets   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 52)]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  enable_ipv6            = true
  create_egress_only_igw = true

  public_subnet_ipv6_prefixes                    = [0, 1, 2]
  public_subnet_assign_ipv6_address_on_creation  = true
  private_subnet_ipv6_prefixes                   = [3, 4, 5]
  private_subnet_assign_ipv6_address_on_creation = true
  intra_subnet_ipv6_prefixes                     = [6, 7, 8]
  intra_subnet_assign_ipv6_address_on_creation   = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }
}

module "aws_eks" {
  source = "../.."

  prefix        = var.prefix
  project       = var.project
  environment   = var.environment
  region_code   = var.region_code
  whitelist_ips = var.whitelist_ips

  vpc = module.aws_vpc

  cluster_version = var.cluster_version

  node_max_size     = var.node_max_size
  node_min_size     = var.node_min_size
  node_desired_size = var.node_desired_size

  capacity_type = var.capacity_type
  instance_type = var.instance_type
  volume_size   = var.volume_size
  volume_type   = var.volume_type
  iops          = var.iops
  throughput    = var.throughput

  tags = local.tags
}
