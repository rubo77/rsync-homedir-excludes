#!/bin/bash
# Convert an rsync --exclude-from pattern file into a pattern file that
# du --exclude-from understands:
# - comments and blank lines are dropped
# - a leading '/' (rsync transfer-root anchor) is stripped - du has no
#   such anchor and the pattern would never match
# - a trailing '/' (rsync directory-only marker) is stripped - du
#   patterns match files and directories alike anyway
#
# Note: unanchored du patterns match at any depth, so e.g. '/Nextcloud'
# becomes 'Nextcloud' and excludes the name everywhere - fine for size
# estimates. rsync '**' degrades to a single-level '*' under du.
#
# Usage: rsync-to-du-excludes.sh <rsync-excludes> [output-file]
#        writes to stdout if no output file is given

set -euo pipefail

if [ $# -lt 1 ] || [ ! -f "$1" ]; then
    echo "usage: $0 <rsync-excludes> [output-file]" >&2
    exit 1
fi

convert() {
    grep -vE '^\s*(#|$)' "$1" | sed -e 's|^/||' -e 's|/$||'
}

convert "$1" > "${2:-/dev/stdout}"
