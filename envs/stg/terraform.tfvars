# terraform/envs/stg/terraform.tfvars
# ─────────────────────────────────────────────
# STAGING — closer to prod, used for final testing
# ─────────────────────────────────────────────

project     = "nexus-sensorflow"
environment = "stg"
aws_region  = "eu-central-1"

# Networking — stg gets its OWN IP range (10.1.x.x)
# Never share IP ranges between environments!
#vpc_cidr        = "10.1.0.0/16"
#public_subnets  = ["10.1.1.0/24", "10.1.2.0/24"]
#private_subnets = ["10.1.10.0/24", "10.1.11.0/24"]
#azs             = ["eu-central-1a", "eu-central-1b"]

# Kinesis — 2 shards, test closer to real load
#kinesis_shard_count     = 2
#kinesis_retention_hours = 48 # keep data for 2 days

# EC2 — medium instance, 2 nodes
#ec2_instance_type  = "t3.micro" # could be extended to small~$15/month
#ec2_instance_count = 1
