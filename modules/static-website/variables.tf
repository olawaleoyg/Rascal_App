variable bucket_name {
    type = string
}

variable "alternate_domain_names" {
  type    = list(string)
  default = []
}

variable "viewer_certificate" {
  type        = map(any)
}