output "ecr_arn" {
  value = aws_ecr_repository.this.arn
}

output "ecr_registry_id" {
  value = aws_ecr_repository.this.registry_id
}

output "ecr_repository_url" {
  value = aws_ecr_repository.this.repository_url
}
