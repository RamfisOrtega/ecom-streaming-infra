output "bronze_bucket_name" {
  description = "Bronze bucket name"
  value       = aws_s3_bucket.bronze.bucket
}

output "silver_bucket_name" {
  description = "Silver bucket name"
  value       = aws_s3_bucket.silver.bucket
}

output "gold_bucket_name" {
  description = "Gold bucket name"
  value       = aws_s3_bucket.gold.bucket
}

output "glue_scripts_bucket_name" {
  description = "Glue scripts bucket name"
  value       = aws_s3_bucket.glue_scripts.bucket
}

output "bronze_bucket_arn" {
  description = "Bronze bucket ARN"
  value       = aws_s3_bucket.bronze.arn
}

output "silver_bucket_arn" {
  description = "Silver bucket ARN"
  value       = aws_s3_bucket.silver.arn
}

output "gold_bucket_arn" {
  description = "Gold bucket ARN"
  value       = aws_s3_bucket.gold.arn
}