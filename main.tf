resource "aws_s3_bucket" "my_bucket" {
  for_each = var.buckets
  bucket   = each.value.bucket_name
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  for_each = var.buckets
  bucket   = aws_s3_bucket.my_bucket[each.key].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
