# IAM terraform module for GitLab CI on AWS

Manages iam instance profile for GitLab CI deployment on AWS.
IAM profile is used for access to S3 infra buckets such as backups, artifacts store, caches etc..

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.5 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.14 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | The name of used environment | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| gitlab\_iam\_profile\_name | The name of IAM profile for GitLab instances |

