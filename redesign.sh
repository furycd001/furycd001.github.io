#!/usr/bin/env bash
set -euo pipefail

BLOG_DIR="/home/furycd001/d:tour"
CSS_FILE="$BLOG_DIR/themes/mnml/assets/css/main.css"

if [ ! -f "$CSS_FILE" ]; then
  echo "Could not find $CSS_FILE -- edit BLOG_DIR at the top of this script if your path differs." >&2
  exit 1
fi

TS=$(date +%Y%m%d-%H%M%S)
cp "$CSS_FILE" "$CSS_FILE.bak-$TS"
echo "Backed up to $CSS_FILE.bak-$TS"

python3 - "$CSS_FILE" << 'PYEOF'
import re, sys
path = sys.argv[1]
css = open(path).read()
new_css, n = re.subn(
    r'(\.post-list\s*\{[^}]*?gap:\s*)1\.6rem(;)',
    r'\g<1>0.5rem\g<2>',
    css,
    count=1
)
if n == 0:
    print("Could not find the expected '.post-list { ... gap: 1.6rem; }' rule -- no changes made. Open main.css and change the gap under .post-list manually to 0.5rem.")
else:
    open(path, 'w').write(new_css)
    print("Updated .post-list gap: 1.6rem -> 0.5rem")
PYEOF

echo "Done. Run 'hugo server -D' from $BLOG_DIR to preview, then commit and push."
