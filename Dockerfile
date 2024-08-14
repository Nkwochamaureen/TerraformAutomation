# Use an image with Terraform and other necessary tools
FROM hashicorp/terraform:latest

# Install necessary tools including nginx
RUN apk add --no-cache curl git nginx tar

# Install terraform-docs
RUN curl -LO https://github.com/terraform-docs/terraform-docs/releases/download/v0.14.0/terraform-docs-v0.14.0-linux-amd64.tar.gz && \
    tar -xzf terraform-docs-v0.14.0-linux-amd64.tar.gz && \
    mv terraform-docs /usr/local/bin/ && \
    rm terraform-docs-v0.14.0-linux-amd64.tar.gz

# Copy necessary files
COPY generate_docs.sh /usr/local/bin/generate_docs.sh
COPY README.md /usr/local/src/README.md

# Ensure the script is executable
RUN chmod +x /usr/local/bin/generate_docs.sh

# Create necessary directories
RUN mkdir -p /usr/share/nginx/html

# Set the working directory
WORKDIR /C:/Users/Admin/OneDrive - Federal University of Technology, Owerri/Documents/TerraformAutomation/TerraformAutomation

# Expose the port on which the container will listen
EXPOSE 8080

# Define the entrypoint
ENTRYPOINT ["/usr/local/bin/generate_docs.sh"]




