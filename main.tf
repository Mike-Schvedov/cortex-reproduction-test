resource "aws_s3_bucket" "my_bucket" {
  for_each = var.buckets
  bucket   = each.value.bucket_name
}


