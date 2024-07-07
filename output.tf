
output "bucket_website_url" {
  description = "Website URL of the S3 bucket"
  value       = "http://${aws_s3_bucket_website_configuration.website_config_tf.website_endpoint}"
}