#!/bin/bash

pdf_path=$1
root_template=$2
page_template=$3

generate_root() {
    local dir=$1
    local depth=0
    find "$dir" -type f -name "*.pdf" -exec sh -c 'stat --format="<tr><td><a href=\"%n\">%n</a></td><td>%s</td><td>%y</td></tr>" "{}" | sed "s|>./|>|" | sed "s|.pdf<|<|"' \;
}

links=$(generate_root "$pdf_path")

# 读取模板文件并替换占位符
output_path="$pdf_path/index.html"
awk -v links="$links" '{
    if ($0 ~ /{{Links}}/) {
        print links;
    } else {
        print $0;
    }
}' "$root_template" > "$output_path"
