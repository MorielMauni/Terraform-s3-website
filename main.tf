# Documentation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

# Create S3 Bucket
resource "aws_s3_bucket" "website-bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_bucket_name
  }
}

# Ownership control to s3 bucket
resource "aws_s3_bucket_ownership_controls" "s3-ownership" {
  bucket = aws_s3_bucket.website-bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Make the s3 bucket public
resource "aws_s3_bucket_public_access_block" "s3-public" {
  bucket = aws_s3_bucket.website-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Public read
resource "aws_s3_bucket_acl" "s3-public-read" {
  depends_on = [aws_s3_bucket_ownership_controls.s3-ownership]

  bucket = aws_s3_bucket.website-bucket.id
  acl    = "public-read"
}

# Add file "index.html"
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.website-bucket.id
  key = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

# Add file "error.html"
resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.website-bucket.id
  key = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}

# Add file "styles.css"
resource "aws_s3_object" "styles" {
  bucket = aws_s3_bucket.website-bucket.id
  key = "styles.css"
  source = "styles.css"
  acl = "public-read"
  content_type = "text/css"
}

# Add file "photo"
resource "aws_s3_object" "photo" {
  bucket = aws_s3_bucket.website-bucket.id
  key = "profile.png"
  source = "profile.png"
  acl = "public-read"
  content_type = "image/png"
}

# Website Configuration
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [ aws_s3_bucket_acl.s3-public-read ]
}