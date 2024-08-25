# #!/bin/bash

# # Define the output file
# output_file="docs/terraform-docs.md"

# # Clear or create the output file
# echo "# Terraform Documentation" > "$output_file"
# echo "" >> "$output_file"

# # Function to generate documentation for each module and subfolder
# generate_docs() {
#   local path="$1"

#   for folder in "$path"/*/; do
#     if [ -d "$folder" ]; then
#       folder_name=$(basename "$folder")
#       echo "## Documentation for $folder_name" >> "$output_file"
#       echo "" >> "$output_file"
      
#       # Generate Terraform documentation for this folder
#       terraform-docs markdown table "$folder" >> "$output_file"
#       echo "" >> "$output_file"

#       # Recursively generate docs for subfolders
#       generate_docs "$folder"
#     fi
#   done
# }

# # Start generating docs from the current directory
# generate_docs .

# echo "Documentation generation completed! Check the $output_file file."

# #!/bin/bash

# # Define the output file
# output_file="docs/terraform-docs.md"

# # Ensure the docs directory exists
# mkdir -p docs

# # Clear or create the output file
# echo "# Terraform Documentation" > "$output_file"
# echo "" >> "$output_file"

# # Function to generate documentation for each module and subfolder
# generate_docs() {
#   local path="$1"

#   for folder in "$path"/*/; do
#     if [ -d "$folder" ]; then
#       folder_name=$(basename "$folder")
#       echo "## Documentation for $folder_name" >> "$output_file"
#       echo "" >> "$output_file"
      
#       # Generate Terraform documentation for this folder
#       terraform-docs markdown table "$folder" >> "$output_file"
#       echo "" >> "$output_file"

#       # Recursively generate docs for subfolders
#       generate_docs "$folder"
#     fi
#   done
# }

# # Check if terraform-docs is installed
# if ! command -v terraform-docs &> /dev/null; then
#   echo "terraform-docs could not be found, please install it first."
#   exit 1
# fi

# # Start generating docs from the current directory
# generate_docs .

# # Build MkDocs site
# mkdocs build

# echo "Documentation generation completed! Check the $output_file file."

#!/bin/bash

# Define the output file
output_file="docs/terraform-docs.md"

# Ensure the docs directory exists
mkdir -p docs

# Clear or create the output file
echo "# Terraform Documentation" > "$output_file"
echo "" >> "$output_file"

# Function to generate documentation for each module and subfolder
generate_docs() {
  local path="$1"

  for folder in "$path"/*/; do
    if [ -d "$folder" ]; then
      # Check if the folder contains any .tf files (indicating it's a Terraform module)
      if ls "$folder"/*.tf > /dev/null 2>&1; then
        folder_name=$(basename "$folder")
        echo "## Documentation for $folder_name" >> "$output_file"
        echo "" >> "$output_file"
        
        # Generate Terraform documentation for this folder
        terraform-docs markdown table "$folder" >> "$output_file"
        echo "" >> "$output_file"
      fi

      # Recursively generate docs for subfolders
      generate_docs "$folder"
    fi
  done
}

# Check if terraform-docs is installed
if ! command -v terraform-docs &> /dev/null; then
  echo "terraform-docs could not be found, please install it first."
  exit 1
fi

# Start generating docs from the current directory
generate_docs .

# Build MkDocs site
mkdocs build

echo "Documentation generation and MkDocs site build completed! Check the $output_file file."
