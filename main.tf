resource "aws_s3_bucket" "test_bucket" {
  bucket = "cortex-repro-bucket-2026"
}

# This is the exact code that triggers the "READ permission to everyone" rule
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.test_bucket.id
  acl    = "public-read"
}
