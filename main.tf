resource "aws_iam_role" "gitlab_s3_role" {
  name = "${var.environment}-gitlab-s3-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    Environment = var.environment
  }
}

resource "aws_iam_instance_profile" "gitlab_iam_profile" {
  name = "${var.environment}-gitlab-s3-profile"
  role = aws_iam_role.gitlab_s3_role.name
}

resource "aws_iam_role_policy" "gitlab_iam_policy" {
  name = "${var.environment}-gitlab-s3-policy"
  role = aws_iam_role.gitlab_s3_role.id

  policy = <<EOF
{
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::${var.environment}-gitlab-ci-aws-*/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:AbortMultipartUpload",
                "s3:ListMultipartUploadParts",
                "s3:ListBucketMultipartUploads"
            ],
            "Resource": "arn:aws:s3:::${var.environment}-gitlab-ci-aws-*/*"
        }
    ]
}
EOF
}
