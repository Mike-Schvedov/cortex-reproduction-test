variable "buckets" {
  type = map(object({
    bucket_name = string
  }))
  default = {
    "site_a" = { bucket_name = "cortex-repro-alpha" }
  }
}
