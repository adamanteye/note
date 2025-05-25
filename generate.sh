#!/bin/bash

REPO="https://github.com/adamanteye/note"
pdf_path=$1
template=$2

print_files() {
    find "$1" -maxdepth 1 -type f -name "*.pdf" | sort | while read -r file; do
        local name=$(basename "$file")
        local size=$(du -sk "$file" | awk '{print $1}')
        local f="${file%.*}.ref"
        read date time zone sha1 <<<"$(cat "$f")"
        echo "<tr><td><a href=\"$name\" target=\"_blank\">$name</a></td><td>$size</td><td><a href=\"$REPO/commit/$sha1\" target=\"_blank\">$date $time $zone</a></td></tr>"
    done
}

print_dirs() {
    find "$1" -mindepth 1 -maxdepth 1 -type d ! -name '.' ! -name '..' ! -name 'assets' | sort | while read -r dir; do
        local name=$(basename "$dir")
        local size=$(du -sk "$dir" | awk "{print \$1}")
        echo "<tr><td><a href=\"$name/\">$name</a></td><td>$size</td></tr>"
    done
}

render_html() {
    local dir=$1
    mkdir -p "$dir"
    local template=$2
    local depth=$3
    local files=$(print_files "$dir")
    local dirs=$(print_dirs "$dir")
    if [[ $depth -ne 0 ]]; then
        local backwards="<nav><a href=../>Back</a></nav>"
    else
        local backwards=""
    fi
    awk -v files="$(printf '%s\n' "$files")" -v dirs="$(printf '%s\n' "$dirs")" -v backwards="$(printf '%s\n' "$backwards")" '{
        if ($0 ~ /\{\{files\}\}/) {
            print files;
        } else if ($0 ~ /\{\{dirs\}\}/) {
            print dirs;
        } else if ($0 ~ /\{\{backwards\}\}/) {
            print backwards;
        } else {
            print $0;
        }
    }' "$template" >"$dir/index.html"

    for subdir in "$dir"/*; do
        if [[ -d $subdir && $(basename "$subdir") != '.' && $(basename "$subdir") != '..' && $(basename "$subdir") != 'assets' ]]; then
            render_html "$subdir" "$template" $((depth + 1))
        fi
    done
}

render_html "$pdf_path" "$template" 0
