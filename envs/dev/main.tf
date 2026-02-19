terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82.0"
    }
  }

  backend "s3" {
    bucket         = "nexus-sensorflow-tfstate-eu-prod"
    key            = "envs/dev/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "nexus-sensorflow-tf-lock"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

# ── S3 ───────────────────────────────────────
resource "aws_s3_bucket" "sensor_data" {
  bucket        = "${var.project}-${var.environment}-sensor-data"
  force_destroy = true

  tags = {
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "sensor_data" {
  bucket = aws_s3_bucket.sensor_data.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sensor_data" {
  bucket = aws_s3_bucket.sensor_data.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "sensor_data" {
  bucket                  = aws_s3_bucket.sensor_data.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ── Networking ───────────────────────────────
module "networking" {
  source          = "../../terraform/modules/networking"
  project         = var.project
  environment     = var.environment
  aws_region      = var.aws_region
  vpc_cidr        = var.vpc_cidr
  public_subnet_a = var.public_subnet_a
  public_subnet_b = var.public_subnet_b
}

# ── Compute ──────────────────────────────────
module "compute" {
  source         = "../../terraform/modules/compute"
  project        = var.project
  environment    = var.environment
  instance_type  = var.ec2_instance_type
  vpc_id         = module.networking.vpc_id
  subnet_id      = module.networking.public_subnet_a
  raw_bucket_arn = aws_s3_bucket.sensor_data.arn
}
