locals {
  table_name  = "samanja-TF-table"
  ############## IAM Users ##############
  users = concat(var.Groups.Administrators.users, var.Groups.Developers.users, var.Groups.Tools.users)
}