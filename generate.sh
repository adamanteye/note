#!/usr/bin/env bash

pdf_path=$1
template=$2

print_files() {
    find "$1" -maxdepth 1 -type f -name "*.pdf" -exec bash -c '
        for file; do
            repo="https://github.com/adamanteye/note"
            name=$(basename "$file")
            size=$(du -sk "$file" | awk "{print \$1}")
            f="${file%.*}.ref"
            read date time zone sha1 <<< $(cat "$f")
            rm -f "$f"
            stat --format="<tr><td><a href=\"$name\" target=\"_blank\">$name</a></td><td>$size</td><td><a href=\"$repo/commit/$sha1\" target=\"_blank\">$date $time $zone</a></td></tr>" "$file"
        done
    ' bash {} +
}

print_dirs() {
    find "$1" -mindepth 1 -maxdepth 1 -type d ! -name '.' ! -name '..' ! -name 'assets' -exec sh -c '
        for dir; do
            name=$(basename "$dir")
            size=$(du -sk "$dir" | awk "{print \$1}")
            stat --format="<tr><td><a href=\"$name/\">$name</a></td><td>$size</td></tr>" "$dir"
        done
    ' sh {} +
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
        if ($0 ~ /{{files}}/) {
            print files;
        } else if ($0 ~ /{{dirs}}/) {
            print dirs;
        } else if ($0 ~ /{{backwards}}/) {
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
