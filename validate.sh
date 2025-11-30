#!/bin/bash

REQUIRED="Copyright (c) 2025 Achraf BEN CHEIKH LADHARI"

# Search recursively for all YAML files across the entire project
FILES=$(find . -type f \( -name "*.yml" -o -name "*.sh" -o -name "*.config" -o -name "*.yaml" -o -name "Vagrantfile" \))

for file in $FILES; do
    if ! grep -q "$REQUIRED" "$file"; then
        echo "Error: Required license header missing in $file"
        exit 1
    fi
done

echo "All files contain the required license header."
