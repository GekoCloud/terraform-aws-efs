output "id" {
  description = "File system ID"
  value       = aws_efs_file_system.this.id
}

output "arn" {
  description = "File system ARN"
  value       = aws_efs_file_system.this.arn
}
