resource "aws_s3_bucket" "bk5667899" {
  bucket        = "bk5667899"
  force_destroy = false

  tags = {
    Name  = "bk5667899"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_versioning" "bk5667899_versioning" {
  bucket = aws_s3_bucket.bk5667899.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk5667899_encryption" {
  bucket = aws_s3_bucket.bk5667899.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "bk5667899_public_access_block" {
  bucket = aws_s3_bucket.bk5667899.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

output "bk5667899_bucket_id" {
  description = "The name (ID) of the S3 bucket bk5667899"
  value       = aws_s3_bucket.bk5667899.id
}

output "bk5667899_bucket_arn" {
  description = "The ARN of the S3 bucket bk5667899"
  value       = aws_s3_bucket.bk5667899.arn
}

output "bk5667899_bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket bk5667899"
  value       = aws_s3_bucket.bk5667899.bucket_regional_domain_name
}