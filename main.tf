resource "aws_s3_bucket" "test_bucket" {
  bucket = "cortex-repro-bucket-2026"
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.test_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.test_bucket.id
  rule {
    id     = "expire-old-objects"
    status = "Enabled"
    expiration {
      days = 90
    }
  }
}
