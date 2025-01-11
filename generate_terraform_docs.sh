#!/bin/bash
# Build MkDocs site
 mkdocs build

# echo "Documentation generation and MkDocs site build completed!"
MODULES_DIR="./modules"  # Assuming modules directory is at the root of your project

# Function to generate documentation for each module and subfolder
generate_docs() {
  local path="$1"
  local parent_path="$2"

  echo "Processing folder: $path"

  for folder in "$path"/*; do
    if [ -d "$folder" ]; then
      folder_name=$(basename "$folder")
      echo "Found directory: $folder_name"

      if [[ "$folder_name" == "load_balancer" ]]; then
        doc_file="docs/load_balancer.md"
      elif [[ "$folder_name" == "network" ]]; then
        doc_file="docs/network.md"
      else
        doc_file="docs/${parent_path}${folder_name}.md"
      fi

      echo "# Documentation for $folder_name" > "$doc_file"
      echo "" >> "$doc_file"
      terraform-docs markdown table "$folder" >> "$doc_file"
      echo "" >> "$doc_file"

      # Recursively process subfolders
      generate_docs "$folder" "${parent_path}${folder_name}/"
    else
      echo "Skipping non-directory: $folder"
    fi
  done
}
