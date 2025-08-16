#!/bin/bash

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
dir="${1:-.}"
out_dir="${2:-${dir}}"
combined=""
extract_unique_chars() {
    local text="$1"
    echo "$text" | grep -o . | sort -u | tr -d '\n'
}
while IFS= read -r -d '' file; do
    if [[ -f "$file" ]]; then
        mime_info=$(file -b --mime "$file" 2>/dev/null)
        if [[ "$mime_info" == *"text"* ]]; then
            if content=$(cat "$file" 2>/dev/null); then
                if echo "$content" | iconv -f utf-8 -t utf-8 >/dev/null 2>&1; then
                    combined+="$content"
                else
                    echo "Warning: skipping non-UTF8 file: $file" >&2
                fi
            else
                echo "Warning: cannot open $file" >&2
            fi
        fi
    fi
done < <(find "$dir" -type f -print0)
unique_chars=$(extract_unique_chars "$combined")
mkdir -p "$out_dir"
allsorts subset -t "$unique_chars" /usr/share/fonts/MapleMono-NL-CN-Regular.ttf "$out_dir"/out.ttf > /dev/null
woff2_compress "$out_dir"/out.ttf > /dev/null 2>&1
mv "$out_dir"/out.woff2 "$out_dir"/maple.woff2
rm -f "$out_dir"/out.ttf
