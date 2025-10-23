set -euo pipefail
PASSWD_FILE="${1:-/etc/passwd}"

if [[ ! -r "$PASSWD_FILE" ]]; then
  echo "Error: cannot read file '$PASSWD_FILE'" >&2
  exit 2
fi
awk -F: '$7 ~ /bash$/ { print $1 }' "$PASSWD_FILE"