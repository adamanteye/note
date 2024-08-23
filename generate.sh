#!/bin/zsh

# 读取目录并生成PDF文件的路径和最后修改时间
read_directory() {
    local dir=$1
    find "$dir" -type f -name "*.pdf" -exec stat --format='<tr><td><a href="{}">{}</a></td><td>%y</td></tr>' "{}" \;
}

pdf_path=$1
template_file=$2

# 生成PDF文件的链接表格
pdf_links=$(read_directory "$pdf_path")

# 读取模板文件并替换占位符
output_path="$pdf_path/index.html"
awk -v pdf_links="$pdf_links" '{
    if ($0 ~ /{{pdfLinks}}/) {
        print pdf_links;
    } else {
        print $0;
    }
}' "$template_file" > "$output_path"

echo "Generated $output_path"
