provider "aws" {
  region  = "us-east-1"       # or the region where your bucket exists
  profile = "chatbot"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = "myychatbot"       # Updated bucket name

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = "myychatbot"       # Updated bucket name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::myychatbot/*"   # Updated bucket name
      }
    ]
  })
}

resource "aws_s3_object" "website_files" {
  for_each = fileset("../chatbot-webapp-devops/frontend", "**")

  bucket = "myychatbot"       # Updated bucket name
  key    = each.value
  source = "../chatbot-webapp-devops/frontend/${each.value}"
  etag   = filemd5("../chatbot-webapp-devops/frontend/${each.value}")
  content_type = lookup(
    {
      html = "text/html"
      css  = "text/css"
      js   = "application/javascript"
      png  = "image/png"
    },
    split(".", each.value)[length(split(".", each.value)) - 1],
    "text/plain"
  )
}
