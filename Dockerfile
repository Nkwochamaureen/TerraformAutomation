# Use a slim Python image
# FROM python:3.11-slim

# # Set working directory
# WORKDIR /app

# # Copy necessary files
# COPY README.md /app/README.md 
# COPY . /app

# # Upgrade pip before installing dependencies
# RUN pip install --upgrade pip

# # Create a virtual environment
# RUN python -m venv venv

# # Activate the virtual environment
# ENV PATH="/app/venv/bin:$PATH"

# # Install Python dependencies
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt

# # Install curl for downloading terraform-docs
# RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*


#  RUN curl -LO https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz \
#      && tar -xzf terraform-docs-v0.16.0-linux-amd64.tar.gz \
#      && mv terraform-docs /usr/local/bin/

# # Build the documentation
# RUN mkdocs build     
    
# # Expose port for serving documentation
# EXPOSE 8080

# # Command to run: Generate documentation and serve
# CMD ["venv/bin/mkdocs", "serve", "-a", "0.0.0.0:8080"]

# Use a slim Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy necessary files
COPY README.md /app/README.md 
COPY . /app

# Upgrade pip before installing dependencies
RUN pip install --upgrade pip

# Create a virtual environment
RUN python -m venv venv

# Activate the virtual environment
ENV PATH="/app/venv/bin:$PATH"

# Install Python dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Install curl for downloading terraform-docs
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Install curl and inotify-tools for downloading terraform-docs and monitoring
RUN apt-get update && apt-get install -y curl inotify-tools && rm -rf /var/lib/apt/lists/*

# Download and install terraform-docs
RUN curl -LO https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz \
    && tar -xzf terraform-docs-v0.16.0-linux-amd64.tar.gz \
    && mv terraform-docs /usr/local/bin/    

# Copy the scripts
COPY generate_terraform_docs.sh /app/generate_terraform_docs.sh
COPY watch_changes.sh /app/watch_changes.sh

# Make the scripts executable
RUN chmod +x /app/generate_terraform_docs.sh /app/watch_changes.sh    

# Build the documentation
RUN mkdocs build

#  #Generate Terraform documentation
#  RUN terraform-docs markdown table . > docs/terraform-docs.md

# Expose port for serving documentation ..
EXPOSE 8080

# Run both the watch_changes.sh script and the HTTP server concurrently with a delay to ensure proper order
CMD ["sh", "-c", "/bin/bash /app/watch_changes.sh & sleep 5 && python -m http.server 8080 --directory site"]






