#!/usr/bin/env bash
set -euo pipefail

# Usage: ./fix-http-to-https.sh [--dry-run]

DRY_RUN=0
BACKUP_EXT=".bak"

if [[ ${1:-} == "--dry-run" ]]; then
  DRY_RUN=1
fi

# List of replacements: "old|new"
patterns=(
  "http://github.com|https://github.com"
  "http://www.github.com|https://github.com"
  "http://gohugo.io|https://gohugo.io"
  "http://www.gohugo.io|https://gohugo.io"
  "http://discourse.gohugo.io|https://discourse.gohugo.io"
  "http://raw.githubusercontent.com|https://raw.githubusercontent.com"
  "http://fonts.googleapis.com|https://fonts.googleapis.com"
  "http://maxcdn.bootstrapcdn.com|https://maxcdn.bootstrapcdn.com"
  "http://cdnjs.cloudflare.com|https://cdnjs.cloudflare.com"
)

# Find tracked files that contain "http://"
mapfile -t FILES < <(git ls-files | xargs -r grep -Il "http://")

echo "Found ${#FILES[@]} files containing http://"

for f in "${FILES[@]}"; do
  echo " - $f"
done

echo

if [[ $DRY_RUN -eq 1 ]]; then
  echo "Dry-run mode: No files will be modified."
fi

# Process each file
for file in "${FILES[@]}"; do
  tmpfile="$(mktemp)"
  cp "$file" "$tmpfile"

  changed=0

  # Apply each simple sed replacement
  for p in "${patterns[@]}"; do
    old="${p%%|*}"
    new="${p##*|}"

    sed -i "s|$old|$new|g" "$tmpfile"
  done

  if ! cmp -s "$file" "$tmpfile"; then
    if [[ $DRY_RUN -eq 1 ]]; then
      echo "[DRY-RUN] Would modify: $file"
    else
      cp "$file" "${file}${BACKUP_EXT}"
      mv "$tmpfile" "$file"
      echo "Modified: $file"
    fi
  else
    rm "$tmpfile"
  fi
done

if [[ $DRY_RUN -eq 1 ]]; then
  echo
  echo "Dry-run complete."
  exit 0
fi

echo
echo "Staging changes..."
git add -A

echo "Committing..."
git commit -m "docs: Update insecure http links to https across documentation"

git show --pretty=email --unified=3 HEAD > fix-http-links.patch
echo "Patch saved to fix-http-links.patch"
