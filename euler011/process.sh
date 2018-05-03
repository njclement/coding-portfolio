sed 's/ /, /g' input.txt > input2.txt

sed 's/^/[/' input2.txt > input3.txt
rm input2.txt

sed 's/$/],/' input3.txt > input4.txt
rm input3.txt

