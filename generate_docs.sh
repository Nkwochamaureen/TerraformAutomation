#!/bin/sh

# Install terraform-docs if it's not already installed
if ! command -v terraform-docs &> /dev/null; then
    echo "terraform-docs not found, installing..."
    curl -sSL https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.1/terraform-docs-v0.16.1-linux-amd64.tar.gz | tar -xzC /usr/local/bin terraform-docs
fi

# Change directory to where your Terraform files are located
cd /workspace

# Generate documentation in markdown format
terraform-docs markdown . > README.md

# Serve the documentation using a simple web server
apk add --no-cache nginx
cp /usr/share/nginx/html/index.html /usr/share/nginx/html/index.html.bak
echo "<html><body><pre>$(cat README.md)</pre></body></html>" > /usr/share/nginx/html/index.html

# Start Nginx to serve the documentation
nginx -g 'daemon off;'
