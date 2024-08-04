# Use an image with Terraform and other necessary tools
FROM hashicorp/terraform:latest

# Install necessary tools including nginx
RUN apk add --no-cache curl git nginx

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



