#!/bin/bash

pdf_path=$1
template=$2

print_files() {
    find "$1" -maxdepth 1 -type f -name "*.pdf" -exec sh -c '
        for file; do
            name=$(basename "$file")
            stat --format="<tr><td><a href=\"$name\">$name</a></td><td>%s</td><td>%y</td></tr>" "$file"
        done
    ' sh {} +
}

print_dirs() {
    find "$1" -mindepth 1 -maxdepth 1 -type d ! -name '.' ! -name '..' ! -name 'assets' -exec sh -c '
        for dir; do
            name=$(basename "$dir")
            stat --format="<tr><td><a href=\"$name/\">$name</a></td><td>%s</td><td>%y</td></tr>" "$dir"
        done
    ' sh {} +
}

render_html() {
    local dir=$1
    mkdir -p "$dir"
    local template=$2
    local files
    files=$(print_files "$dir")
    local dirs
    dirs=$(print_dirs "$dir")

    awk -v files="$(printf '%s\n' "$files")" -v dirs="$(printf '%s\n' "$dirs")" '{
        if ($0 ~ /{{files}}/) {
            print files;
        } else if ($0 ~ /{{dirs}}/) {
            print dirs;
        } else {
            print $0;
        }
    }' "$template" > "$dir/index.html"

    for subdir in "$dir"/*; do
        if [[ -d $subdir && $(basename "$subdir") != '.' && $(basename "$subdir") != '..' && $(basename "$subdir") != 'assets' ]]; then
            render_html "$subdir" "$template"
        fi
    done
}

render_html "$pdf_path" "$template"
