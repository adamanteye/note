#!/bin/bash
chars=$(cat "build/union.txt")
allsorts subset -t "$chars" /usr/share/fonts/MapleMono-NF-CN-Regular.ttf out.ttf
woff2_compress out.ttf
mv out.woff2 build/maple.woff2
