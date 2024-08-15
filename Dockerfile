# Use a slim Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy necessary files
COPY README.md /app/README.md 
COPY . /app

# Install mkdocs (which is a Python package)
RUN pip install --no-cache-dir mkdocs

# Install terraform-docs by downloading the binary
RUN apt-get update && apt-get install -y wget && \
    wget https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz && \
    tar -xzf terraform-docs-v0.16.0-linux-amd64.tar.gz && \
    mv terraform-docs /usr/local/bin/terraform-docs && \
    chmod +x /usr/local/bin/terraform-docs

# Expose port for serving documentation
EXPOSE 8080

# Command to run: Generate documentation and serve
CMD ["mkdocs", "serve"]





