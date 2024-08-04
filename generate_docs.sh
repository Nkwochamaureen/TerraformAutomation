#!/bin/bash

# Generate documentation
terraform-docs markdown . > /workspace/docs.md

# Move documentation to the nginx directory
mkdir -p /usr/share/nginx/html
cp /workspace/docs.md /usr/share/nginx/html/index.html

# Start nginx in the foreground
nginx -g 'daemon off;'
