# 1. SECRET MISCONFIGURATION (Hardcoded Key)
locals {
  test_metadata = {
    api_key = "XVGYUhyauety23899ajjjagGGGG"
  }
}

# 2. IAC MISCONFIGURATION (Public Access)
resource "aws_s3_bucket" "test_bucket" {
  bucket = "cortex-repro-bucket-2026"
  acl    = "public-read" 
}
