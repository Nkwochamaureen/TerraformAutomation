#!/bin/sh

# Ensure terraform-docs is installed
if ! command -v terraform-docs >/dev/null; then
  echo "terraform-docs not found, installing..."

  #  Consider using package manager if available
  #  e.g., apt-get install terraform-docs

  # Download terraform-docs (replace with appropriate URL and version)
  curl -LO https://github.com/terraform-docs/terraform-docs/releases/download/v0.14.0/terraform-docs-v0.14.0-linux-amd64.tar.gz || exit 1

  tar -xzf terraform-docs-v0.14.0-linux-amd64.tar.gz
  mv terraform-docs /usr/local/bin/
  rm terraform-docs-v0.14.0-linux-amd64.tar.gz
fi

# Change directory to where your Terraform files are located
cd /workspace

# Generate documentation
terraform-docs markdown table . > /usr/share/nginx/html/index.html

# Handle README.md (modify path if needed)
if [ -f /path/to/your/README.md ]; then
  cat /path/to/your/README.md >> /usr/share/nginx/html/index.html
fi

# Start Nginx to serve the documentation
nginx -g 'daemon off;'

