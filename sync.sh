#!/bin/bash

if [ $# -lt 1 ] ; then  
    echo "Usage:"
    echo "./sync.sh file"
    exit 1
fi

file=$1
if [ ! -e $file ]; then
    echo "$file 不存在"
    exit 1
fi

path="jiaolong@115.231.105.164:/www/jiaolong/"

cat $file | while read line; do
    echo "copy from $path$line to ./$line";
    scp -P 34185 -r   $path$line ./$line
done
