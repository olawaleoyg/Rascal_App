
# #################################
# DEVELOPERS GROUP
# #################################

# CREATE DEVELOPERS GROUP
resource "aws_iam_group" "developer_group" {
  name = var.Groups.Developers.group_name
}

# ATTACH USERS TO THE CREATED DEVELOPERS GROUP
resource "aws_iam_group_membership" "developer_group_user_attachment" {
  name = var.developer_group_user_attachment

  users = var.Groups.Developers.users

  group = aws_iam_group.developer_group.name
  depends_on = [
    module.iam_user
  ]
}

# ATTACH-SELF-MANAGEMENT-POLICY-TO-DEVELOPERS
resource "aws_iam_policy" "developer_self_management_policy" {
  name        = "${var.Groups.Developers.group_name}-IAMSelfManagePolicy"
  description = "self managed policy to developers"
  policy      = file("policies/IAMSelfManagePolicy.json")
}

resource "aws_iam_group_policy_attachment" "developers_self_mgt_group_policy_attachment" {
  group      = aws_iam_group.developer_group.name
  policy_arn = aws_iam_policy.developer_self_management_policy.arn
}


# ATTACH-DEVELOPER-CLUSTER-ACCESS-POLICY-TO-DEVELOPERS
resource "aws_iam_policy" "developer_cluster_access_policy" {
  name        = "${var.Groups.Developers.group_name}-DeveloperClusterAccess"
  description = "developer cluster access policy to developers"
  policy      = file("policies/DeveloperClusterAccess.json")
}

resource "aws_iam_group_policy_attachment" "developers_cluster_access_group_policy_attachment" {
  group      = aws_iam_group.developer_group.name
  policy_arn = aws_iam_policy.developer_cluster_access_policy.arn
}



#-----------------------------------------------------------


# #################################
# ADMINISTRATORS GROUP
# #################################

# CREATE ADMINISTRATOR GROUP
resource "aws_iam_group" "administrator_group" {
  name = var.Groups.Administrators.group_name
}

resource "aws_iam_group_membership" "administrator_group_user_attachment" {
  name = var.administrator_group_user_attachment

  users = var.Groups.Administrators.users

  group = aws_iam_group.administrator_group.name

  depends_on = [
    module.iam_user
  ]
}

# ATTACH-ACCOUNT-FULL-ACCESS-TO-ADMINISTRATOR
resource "aws_iam_policy" "administrator_full_access_policy" {
  name        = "${var.Groups.Administrators.group_name}-AdministratorAccess"
  description = "full account access to administrators"
  policy      = file("policies/AdministratorAccess.json")
}

resource "aws_iam_group_policy_attachment" "administrators_s3_group_policy_attachment" {
  group      = aws_iam_group.administrator_group.name
  policy_arn = aws_iam_policy.administrator_full_access_policy.arn
}

# ATTACH-ECR-FULL-ACCESS-TO-ADMINISTRATOR
resource "aws_iam_policy" "administrator_ecr_full_access" {
  name        = "${var.Groups.Administrators.group_name}-FullECRAccess"
  description = "full ecr access to administrators"
  policy      = file("policies/FullECRAccess.json")
}

resource "aws_iam_group_policy_attachment" "administrators_ecr_group_policy_attachment" {
  group      = aws_iam_group.administrator_group.name
  policy_arn = aws_iam_policy.administrator_ecr_full_access.arn
}

# ATTACH-SELF-MANAGEMENT-POLICY-TO-ADMINISTRATOR
resource "aws_iam_policy" "administrator_self_management_policy" {
  name        = "${var.Groups.Administrators.group_name}-IAMSelfManagePolicy"
  description = "self managed policy to administrators"
  policy      = file("policies/IAMSelfManagePolicy.json")
}

resource "aws_iam_group_policy_attachment" "administrators_self_mgt_group_policy_attachment" {
  group      = aws_iam_group.administrator_group.name
  policy_arn = aws_iam_policy.administrator_self_management_policy.arn
}


# #################################
# DEVOPS GROUP
# #################################



# #################################
# TESTERS GROUP
# #################################