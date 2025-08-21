variable "name" {
  type = string
  default = "demoUser"
}

variable "force_destroy" {
  type = bool
  default = true
}

variable "create_user" {
  type = bool
  default = false  
}

variable "create_iam_user_login_profile" {
  type = bool
  default = false
}

variable "password_length" {
  type = number
  default = 30
}

variable "permissions_boundary" {
  type = string
  default = ""
}

variable "create_iam_access_key" {
  type = bool
  default = false
}

variable "password_reset_required" {
  type = bool
  default = true
}
