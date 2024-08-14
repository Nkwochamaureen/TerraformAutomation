##!/bin/sh

# Ensure terraform-docs is installed
if ! command -v terraform-docs >/dev/null; then
  echo "terraform-docs not found, assuming it's installed globally (package manager recommended)."
fi

# Change directory to where your Terraform files are located
cd /C:/Users/Admin/OneDrive - Federal University of Technology, Owerri/Documents/TerraformAutomation/TerraformAutomation  # Replace with the actual path within the container

# Generate documentation (use mkdocs for full website structure)
mkdocs build -d /output

# Optionally compress the generated directory (recommended for smaller container size)
tar -czvf /output.tar.gz /output

echo "Documentation generation complete!"

exit 0