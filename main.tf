#S3 Buckets for String files for the Static website
#EC2 Instance for hosting the webserver
# -Pawan K. Pradhan


#Provisioning S3 Bucket

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name

    tags = {
      "usage" =  "terraform"
    }
}


# Setting up ownership controls
resource "aws_s3_bucket_ownership_controls" "own_controls" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


# Setting up access block for s3
resource "aws_s3_bucket_public_access_block" "accessblock_tf" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


#Setting up s3 bucket access control layers i.e. public-read in this case
resource "aws_s3_bucket_acl" "s3_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.own_controls,
    aws_s3_bucket_public_access_block.accessblock_tf,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

#Static website configurations
resource "aws_s3_bucket_website_configuration" "website_config_tf" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}