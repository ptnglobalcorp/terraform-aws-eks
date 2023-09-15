variable "prefix" {
  type = string
  description = "A prefix to use for naming resources in the environment."
}

variable "project" {
  type = string
  description = "The name of the project this infrastructure is being created for."
}

variable "environment" {
  type = string
  description = "The name of the environment (e.g. dev, prod)."
}

variable "region_code" {
  type = string
  description = "The AWS region code where the infrastructure will be created."
}

variable "cluster_version" {
  type = string
  description = "The Kubernetes version to use for the EKS cluster."
}

variable "node_desired_size" {
  type = any
  description = "The desired number of worker nodes for the EKS cluster."
}

variable "node_min_size" {
  type = any
  description = "The minimum number of worker nodes for the EKS cluster."
}

variable "node_max_size" {
  type = any
  description = "The maximum number of worker nodes for the EKS cluster."
}

variable "instance_type" {
  type = string
  description = "The EC2 instance type to use for the worker nodes."
}

variable "volume_size" {
  type = any
  description = "The size of the EBS volume to attach to each worker node."
}

variable "volume_type" {
  type = string
  description = "The type of EBS volume to attach to each worker node."
}

variable "iops" {
  type = any
  description = "The number of IOPS to provision for the EBS volume."
}

variable "throughput" {
  type = any
  description = "The throughput to provision for the EBS volume."
}

variable "capacity_type" {
  type = string
  description = "The type of capacity to provision for the EBS volume."
}

variable "whitelist_ips" {
  type = list(string)
}

