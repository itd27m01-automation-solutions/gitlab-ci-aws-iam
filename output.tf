output "gitlab_iam_profile_name" {
  description = "The name of IAM profile for GitLab instances"
  value       = aws_iam_instance_profile.gitlab_iam_profile.name
}