#!/bin/bash
for i in *.md;
do descr=$(egrep -v "^#" $i | head -n1);
title=$(head -n1 $i | sed 's/#//g');
echo -e "#### [$title]($i)\n$descr [Read more...]($i)\n\n" | clipboard;
done
#add tis to apache.md
#TODO fix missing text
#TODO add 3 screenshots for each