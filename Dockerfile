# Use an image with Terraform and other necessary tools
FROM hashicorp/terraform:latest

# Install any additional tools if needed
RUN apk add --no-cache curl git

# Copy your Terraform documentation generation script into the container
COPY generate_docs.sh /usr/local/bin/generate_docs.sh
RUN chmod +x /usr/local/bin/generate_docs.sh

# Set the working directory
WORKDIR /workspace

# Define the entrypoint
ENTRYPOINT ["/usr/local/bin/generate_docs.sh"]
