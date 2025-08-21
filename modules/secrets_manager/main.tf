data "aws_caller_identity" "current" {}

###---secret
resource "aws_secretsmanager_secret" "my_secret" {
  description                    = var.description
  name                           = var.name
  recovery_window_in_days        = var.recovery_window_in_days
  kms_key_id                     = var.kms_key_id



  tags = merge(
    var.tags,
    {
      Name = var.name
    },
  )
}

###---Resource Policy
data "aws_iam_policy_document" "my_secret_policy_document" {
  statement {
    sid    = "EnableAnotherAWSAccountToReadTheSecret"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions   = ["secretsmanager:GetSecretValue"]
    resources = ["*"]
  }
}

resource "aws_secretsmanager_secret_policy" "my_secret_policy" {
  secret_arn = aws_secretsmanager_secret.my_secret.arn
  policy     = data.aws_iam_policy_document.my_secret_policy_document.json
}

### Version
resource "aws_secretsmanager_secret_version" "my_secret_version" {
  secret_id = aws_secretsmanager_secret.my_secret.id
  secret_string = jsonencode(var.secret_data)
}


