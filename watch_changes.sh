#!/bin/bash

# Path to the generate_terraform_docs.sh script
DOC_GEN_SCRIPT="/app/generate_terraform_docs.sh"

# Generate docs initially
bash "$DOC_GEN_SCRIPT"

# Monitor for changes in .tf files and run the generation script
inotifywait -m -r -e modify,create,delete --exclude '.*\.swp$' . |
while read -r directory events filename; do
  if [[ "$filename" == *.tf ]]; then
    echo "Change detected in $filename. Regenerating documentation..."
    bash "$DOC_GEN_SCRIPT"
  fi
done

