output "bucket_name" {
  value = aws_s3_bucket.bucket_logs.bucket
}

output "bucket_prefix" {
  value = aws_s3_bucket.bucket_logs.bucket_prefix
}
