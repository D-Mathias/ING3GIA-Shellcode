#!/bin/sh

objdump -d $1 | tail -n 3 | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | sed 's/^/\\x/g' | perl -pe 's/\r?\n//'