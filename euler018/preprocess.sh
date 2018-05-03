#!/bin/bash

sed -i 's/0\([0-9]\)/\1/g' input.txt 
sed -i 's/ /, /g' input.txt
sed -i 's/^/[/' input.txt
sed -i 's/$/],/' input.txt

mv input.txt input.py

