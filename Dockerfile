# Use an image with Terraform and other necessary tools
FROM hashicorp/terraform:latest

# Install necessary tools including nginx
RUN apk add --no-cache curl git nginx

RUN apk add --no-cache curl tar && \
    curl -LO https://github.com/terraform-docs/terraform-docs/releases/download/v0.14.0/terraform-docs-v0.14.0-linux-amd64.tar.gz && \
    tar -xzf terraform-docs-v0.14.0-linux-amd64.tar.gz && \
    mv terraform-docs /usr/local/bin/ && \
    rm terraform-docs-v0.14.0-linux-amd64.tar.gz

# Copy your Terraform documentation generation script into the container
COPY generate_docs.sh /usr/local/bin/generate_docs.sh
RUN chmod +x /usr/local/bin/generate_docs.sh

# Copy nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Set the working directory
WORKDIR /workspace

# Expose the port on which the container will listen
EXPOSE 8080

ENV PORT 8080

# Define the entrypoint
ENTRYPOINT ["/usr/local/bin/generate_docs.sh"]



