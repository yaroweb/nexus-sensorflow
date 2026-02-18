# terraform/envs/prod/terraform.tfvars
# ─────────────────────────────────────────────
# PRODUCTION — real workload, full power
# ─────────────────────────────────────────────

project     = "nexus-sensorflow"
environment = "prod"
aws_region  = "eu-central-1"

# Networking — prod gets its OWN IP range (10.2.x.x)
#vpc_cidr        = "10.2.0.0/16"
#public_subnets  = ["10.2.1.0/24", "10.2.2.0/24"]
#private_subnets = ["10.2.10.0/24", "10.2.11.0/24"]
#azs             = ["eu-central-1a", "eu-central-1b"]

# Kinesis — 4 shards for real sensor volume
#kinesis_shard_count     = 4
#kinesis_retention_hours = 168   # keep data for 7 days

# EC2 — full size, 3 nodes for redundancy
#ec2_instance_type  = "t3.micro"  # could be extented do t3.medium~$30/month
#ec2_instance_count = 1 # could be extended to 3
#```

#---
