#!/bin/sh

# Ensure terraform-docs is installed
if ! command -v terraform-docs >/dev/null; then
  echo "terraform-docs not found, installing..."
  curl -LO https://github.com/terraform-docs/terraform-docs/releases/download/v0.14.0/terraform-docs-v0.14.0-linux-amd64.tar.gz
  tar -xzf terraform-docs-v0.14.0-linux-amd64.tar.gz
  mv terraform-docs /usr/local/bin/
  rm terraform-docs-v0.14.0-linux-amd64.tar.gz
fi

# Change directory to where your Terraform files are located
cd /workspace

# Generate documentation
terraform-docs markdown table . > /usr/share/nginx/html/index.html

# Serve the documentation using a simple web server
if [ -f /usr/local/src/README.md ]; then
  echo "<html><body><pre>$(cat /usr/local/src/README.md)</pre></body></html>" > /usr/share/nginx/html/index.html
else
  echo "<html><body><h1>README.md not found!</h1></body></html>" > /usr/share/nginx/html/index.html
fi

# Start Nginx to serve the documentation
nginx -g 'daemon off;'
