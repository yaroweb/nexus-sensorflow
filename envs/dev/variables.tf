variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_a" {
  type = string
}

variable "public_subnet_b" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}
