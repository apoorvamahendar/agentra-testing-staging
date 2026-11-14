resource "aws_s3_bucket" "bk34467890876" {
  bucket        = "bk34467890876"
  force_destroy = true

  tags = {
    Name  = "bk34467890876"
    Stack = "s3-bucket"
  }
}

resource "aws_s3_bucket_ownership_controls" "bk34467890876_ownership" {
  bucket = aws_s3_bucket.bk34467890876.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "bk34467890876_public_access_block" {
  bucket = aws_s3_bucket.bk34467890876.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bk34467890876_encryption" {
  bucket = aws_s3_bucket.bk34467890876.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "bk34467890876_versioning" {
  bucket = aws_s3_bucket.bk34467890876.id

  versioning_configuration {
    status = "Disabled"
  }
}