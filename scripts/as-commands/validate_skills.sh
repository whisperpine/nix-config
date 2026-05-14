#!/bin/sh

# Purpose: validate all skills under the give directory.
# Usage: sh path/to/validate_skills.sh DIRECTORY
# Dependencies: yq
# Date: 2026-05-15
# Author: Yusong

set -e

exit_code=0

if [ -z "$1" ]; then
  echo "Error: The directory containing skills is missing."
  echo "Usage: sh validate_skills.sh DIRECTORY"
  exit 1
fi

# Checks if the given markdown file is a valid skill.
validate() {
  filename="$1"

  # Ensures it's a markdown file, otherwise skips the following checks.
  if [ "${filename##*.}" != "md" ]; then
    echo "Error: '$filename' isn't a markdown file."
    exit_code=1
    return
  fi

  # Checks if the frontmatter contains the "description" attribute.
  if ! yq --front-matter=extract \
    eval ".description // error(\"The 'description' attribute is missing in '$filename'.\")" \
    "$filename" >/dev/null; then
    exit_code=1
  fi

  # Checks if the frontmatter contains the "name" attribute.
  # Assigns the value of the "name" attribute to a variable.
  if ! name_attribute=$(yq --front-matter=extract \
    eval ".name // error(\"The 'name' attribute is missing in '$filename'.\")" \
    "$filename"); then
    exit_code=1
  fi

  dir_name=$(basename "$(dirname "$filename")")

  # Checks if the "name" attribute in the frontmatter is the same as the parent dirname.
  if [ "$dir_name" != "$name_attribute" ]; then
    echo "Error: The 'name' attribute in the frontmatter ('$name_attribute') \
must be the same as the dirname ('$dir_name')."
    exit_code=1
  fi

  # Checks if the "name" attribute in the frontmatter is valid:
  #   - Be lowercase alphanumeric with single hyphen separators.
  #   - Not contain consecutive `--`.
  #   - Not start or end with `-`.
  if ! echo "$name_attribute" | grep -E "^[a-z0-9]+(-[a-z0-9]+)*$" >/dev/null 2>&1; then
    echo "Error: Invalid 'name' attribute ('$name_attribute') in the frontmatter of '$filename'."
    exit_code=1
  fi
}

# Loops over all "SKILL.md" files under the give directory.
for filename in "${1%/}"/*/SKILL.md; do
  validate "$filename"
done

exit "$exit_code"
