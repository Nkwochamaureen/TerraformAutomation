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


 RUN curl -LO https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz \
     && tar -xzf terraform-docs-v0.16.0-linux-amd64.tar.gz \
     && mv terraform-docs /usr/local/bin/
    
# Expose port for serving documentation
EXPOSE 8080

# Command to run: Generate documentation and serve
CMD ["venv/bin/mkdocs", "serve", "-a", "0.0.0.0:8080"]





