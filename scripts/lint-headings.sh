#!/usr/bin/env bash

#------------------------------------------------------------------------------
# @file
# Verifies heading structure across the site.
#
# Every Markdown file under content/en must not contain a level 1, level 5,
# or level 6 heading. In addition, every Markdown file within the
# directories listed in the sections array in the main function below,
# excluding _index.md files and the paths listed in the exclusions array,
# must contain these level 2 headings, in this order, and no others:
# "Usage" (required), "Arguments" (optional), "Options" (required if the
# signatures front matter field includes OPTIONS, otherwise prohibited),
# and "Examples" (required). Lines within front matter and fenced code
# blocks are not treated as headings. Reports one error message per file
# per check that does not comply.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# @function
# Displays usage message.
#
# @return string $msg
#   The usage message.
#------------------------------------------------------------------------------
usage() {
  declare msg
  msg=$(cat <<EOT
Verify heading structure across the site: no level 1, level 5, or level 6
headings anywhere, and standard level 2 headings within the configured
sections: Usage, Arguments (optional), Options (required if and only if
the signature includes OPTIONS), and Examples, in that order.

Run with no arguments to discover and check every Markdown file under
content/en. Alternatively, pass one or more file paths to check specific
files.

Usage:    $(basename "$0") [file ...]

Example:  $(basename "$0") content/en/functions/compare/Eq.md
EOT
  )
  printf "%s\\n" "${msg}"
  exit 1
}

#------------------------------------------------------------------------------
# @function
# Reports whether the given path matches any of the given excluded paths.
#
# @param string $1
#   The path to check.
# @param string $2...
#   Zero or more excluded paths.
#
# @return bool
#   True if excluded.
#------------------------------------------------------------------------------
is_excluded() {
  declare -r path="$1"
  shift
  declare excluded
  for excluded in "$@"; do
    [[ "${path}" == "${excluded}" ]] && return 0
  done
  return 1
}

#------------------------------------------------------------------------------
# @function
# Reports whether the given path is within any of the given section
# directories.
#
# @param string $1
#   The path to check.
# @param string $2...
#   Zero or more section directories.
#
# @return bool
#   True if within a section.
#------------------------------------------------------------------------------
in_section() {
  declare -r path="$1"
  shift
  declare section
  for section in "$@"; do
    [[ "${path}" == "${section}"/* ]] && return 0
  done
  return 1
}

#------------------------------------------------------------------------------
# @function
# Prints the ATX headings in the given file, excluding lines within front
# matter and fenced code blocks. A fenced code block opens with three or
# more backticks or tildes, and closes with a fence of the same character
# that is at least as long as the opening fence.
#
# @param string $1
#   The path to the file.
#
# @return string
#   The headings, one per line.
#------------------------------------------------------------------------------
get_headings() {
  declare -r file="$1"
  awk '
    NR == 1 && ($0 == "---" || $0 == "+++") { fm = $0; next }
    fm != "" { if ($0 == fm) fm = ""; next }
    fence == "" && match($0, /^ {0,3}(`{3,}|~{3,})/) {
      s = substr($0, RSTART, RLENGTH); sub(/^ +/, "", s)
      fence = substr(s, 1, 1); len = length(s); next
    }
    fence != "" {
      if (match($0, /^ {0,3}(`{3,}|~{3,}) *$/)) {
        s = substr($0, RSTART, RLENGTH); gsub(/ /, "", s)
        if (substr(s, 1, 1) == fence && length(s) >= len) fence = ""
      }
      next
    }
    /^#{1,6} / { print }
  ' "${file}"
}

#------------------------------------------------------------------------------
# @function
# Reports whether the signatures field in the front matter of the given file
# includes the OPTIONS placeholder.
#
# @param string $1
#   The path to the file.
#
# @return bool
#   True if the signatures field includes OPTIONS.
#------------------------------------------------------------------------------
has_options_signature() {
  declare -r file="$1"
  awk '
    NR == 1 && ($0 == "---" || $0 == "+++") { fm = $0; next }
    NR == 1 { exit 1 }
    $0 == fm { exit found ? 0 : 1 }
    /^ *signatures:/ { insig = 1 }
    insig && !/^ *signatures:/ && !/^ *- / { insig = 0 }
    insig && /OPTIONS/ { found = 1 }
    END { if (!found) exit 1 }
  ' "${file}"
}

#------------------------------------------------------------------------------
# @function
# Main function.
#
# With no arguments, discovers every Markdown file under content/en, then
# re-invokes this script with that file list. With one or more arguments,
# checks each given file for a disallowed heading level, and, for files
# within the sections array that are not _index.md files or listed in the
# exclusions array, for the expected level 2 headings and for agreement
# between the Options heading and the signatures field. Reports a separate
# error message for each check that fails.
#
# @param string $@
#   Zero or more file paths to check.
#------------------------------------------------------------------------------
main() {
  # If run with no arguments, discover files and re-run this script with the file list.
  if (( $# == 0 )); then
    find content/en -type f -name "*.md" -print0 | xargs -0 "$0"
    exit $?
  fi

  # Directories, relative to the project root, whose Markdown files must
  # contain the standard level 2 headings. Add to this list as needed.
  declare -ra sections=(
    "content/en/functions"
    "content/en/methods"
  )

  # Paths, relative to the project root, to exclude from the standard level
  # 2 heading check. Add to this list as needed.
  declare -ra exclusions=(
    "content/en/functions/js/Batch.md"
  )

  # Matches the permitted sequences of level 2 headings, one per line.
  declare -r expected=$'^Usage\n(Arguments\n)?(Options\n)?Examples$'

  declare -i errors=0
  declare actual file headings

  for file in "$@"; do
    headings=$(get_headings "${file}")

    if grep -qE '^# |^##### |^###### ' <<< "${headings}"; then
      echo "Invalid heading structure in ${file}. Found a level 1, level 5, or level 6 heading."
      errors+=1
    fi

    in_section "${file}" "${sections[@]}" || continue
    [[ "$(basename "${file}")" == "_index.md" ]] && continue
    is_excluded "${file}" "${exclusions[@]}" && continue

    actual=$(grep -E '^## ' <<< "${headings}" | sed 's/^## *//; s/ *$//' || true)
    if [[ ! "${actual}" =~ ${expected} ]]; then
      echo "Invalid heading structure in ${file}. Expected level 2 headings Usage, Arguments (optional), Options (conditional), and Examples, in that order."
      errors+=1
    fi

    if has_options_signature "${file}"; then
      if ! grep -qx 'Options' <<< "${actual}"; then
        echo "Invalid heading structure in ${file}. The signature includes OPTIONS, but the Options heading is missing."
        errors+=1
      fi
    elif grep -qx 'Options' <<< "${actual}"; then
      echo "Invalid heading structure in ${file}. Found an Options heading, but the signature does not include OPTIONS."
      errors+=1
    fi
  done

  (( errors == 0 ))
}

set -euo pipefail
main "$@"
