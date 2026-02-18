# terraform/envs/dev/terraform.tfvars
# ─────────────────────────────────────────────
# DEV environment — cheap, small, just for testing
# ─────────────────────────────────────────────

project     = "nexus-sensorflow"
environment = "dev"
aws_region  = "eu-central-1"

# Networking — dev gets its own IP range (10.0.x.x)
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.10.0/24", "10.0.11.0/24"]
azs             = ["eu-central-1a", "eu-central-1b"]

# Kinesis — 1 shard is enough for testing
kinesis_shard_count     = 1
kinesis_retention_hours = 24 # keep data for 1 day

# EC2 — smallest and cheapest instance
ec2_instance_type  = "t3.micro" # ~$8/month
ec2_instance_count = 1          # just 1 node
