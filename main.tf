# This triggers the SECRETS scanner (Hardcoded API Key)
locals {
  test_metadata = {
    api_key = "XVGYUhyauety23899ajjjagGGGG"
  }
}

# This triggers the IAC scanner (Missing Public Access Block & Lifecycle)
resource "aws_s3_bucket" "test_bucket" {
  bucket = "cortex-repro-bucket-2026"
  
  # This specific line triggers the "ACL grants READ permission" rule
  acl    = "public-read" 
}

# NOTE: We have EXCLUDED the 'aws_s3_bucket_public_access_block' 
# and 'aws_s3_bucket_lifecycle_configuration' blocks. 
# Their absence is what causes the IaC misconfiguration findings.
