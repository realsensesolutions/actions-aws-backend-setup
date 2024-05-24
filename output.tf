output "bucket" {
  description = "The S3 bucket to store the remote state file."
  value       = aws_s3_bucket.state.id
}

output "dynamodb" {
  description = "The Dynamodb Table for the lock"
  value       = aws_dynamodb_table.lock.name
} 