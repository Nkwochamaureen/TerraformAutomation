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
cp /usr/share/nginx/html/index.html /usr/share/nginx/html/index.html.bak
echo "<html><body><pre>$(cat README.md)</pre></body></html>" > /usr/share/nginx/html/index.html

# Start Nginx to serve the documentation
nginx -g 'daemon off;'
