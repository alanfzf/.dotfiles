tmpfile="$(mktemp --suffix=.html)"

cat > "$tmpfile"
firefox "$tmpfile"
