# Use a slim Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy necessary files
COPY README.md /app/README.md 
COPY . /app

# Install dependencies
RUN pip install terraform-docs mkdocs

# Expose port for serving documentation
EXPOSE 8080

# Command to run: Generate documentation and serve
CMD ["mkdocs", "serve"]





