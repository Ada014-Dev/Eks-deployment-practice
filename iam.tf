resource "aws_iam_user" "developer" {
  name = "innocent-dev"
  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "developer" {
  user = aws_iam_user.developer.name
}

data "aws_iam_policy_document" "readonly" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*", "eks:List*", "eks:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "policy" {
  name   = "developer"
  user   = aws_iam_user.developer.name
  policy = data.aws_iam_policy_document.readonly.json
}

resource "aws_iam_user_login_profile" "developer" {
  user = aws_iam_user.developer.name
}