# variables.tf
# ─────────────────────────────────────────────
# This file is THE SAME in dev / stg / prod
# It NEVER changes between environments
# It only DECLARES variables, never sets values
# ─────────────────────────────────────────────

variable "project" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Deployment stage: dev, stg or prod"
}

variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
}

variable "vpc_cidr" {
  type        = string
  description = "IP range for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDRs"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones to use"
}

variable "kinesis_shard_count" {
  type        = number
  description = "Number of Kinesis shards (more = faster, costs more)"
}

variable "kinesis_retention_hours" {
  type        = number
  description = "How many hours to keep data in Kinesis stream"
}

variable "ec2_instance_type" {
  type        = string
  description = "EC2 size — this is what changes per environment!"
}

variable "ec2_instance_count" {
  type        = number
  description = "How many EC2 sensor nodes to create"
}
