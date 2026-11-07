data "aws_s3_bucket" "static_site_bucket" {
  bucket = "cloudagentra-statis-site-testing"
}

resource "aws_s3_object" "index_html" {
  bucket       = data.aws_s3_bucket.static_site_bucket.id
  key          = "index.html"
  content_type = "text/html"

  content = <<-HTML
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>AWS Static Website Test</title>
      <style>
        body {
          margin: 0;
          padding: 0;
          display: flex;
          justify-content: center;
          align-items: center;
          min-height: 100vh;
          background-color: #f0f4f8;
          font-family: Arial, sans-serif;
          color: #232f3e;
        }
        .container {
          text-align: center;
          background: #ffffff;
          border-radius: 8px;
          padding: 48px 64px;
          box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
        }
        h1 {
          font-size: 2rem;
          margin-bottom: 16px;
          color: #ff9900;
        }
        p {
          font-size: 1.125rem;
          margin: 0;
        }
      </style>
    </head>
    <body>
      <div class="container">
        <h1>AWS Static Website Test</h1>
        <p>Hello, this is a test website hosted on AWS.</p>
      </div>
    </body>
    </html>
  HTML

  tags = {
    Name  = "index.html"
    Stack = "app"
  }
}

output "index_html_key" {
  description = "S3 object key for the uploaded index.html"
  value       = aws_s3_object.index_html.key
}

output "index_html_etag" {
  description = "ETag of the uploaded index.html object"
  value       = aws_s3_object.index_html.etag
}

output "website_url" {
  description = "S3 static website endpoint URL"
  value       = "http://cloudagentra-statis-site-testing.s3-website.ap-south-1.amazonaws.com"
}