#!/bin/bash

USERNAME="amanluthra001"
EMAIL="amanluthra804@gmail.com"
REPO="shell-scripting-assignment"

git config --global user.name "$USERNAME"
git config --global user.email "$EMAIL"

mkdir -p $REPO
cd $REPO

cat > q2_hello_world.sh << 'EOF'
#!/bin/bash
echo "Hello, World!"
EOF

chmod +x q2_hello_world.sh

cat > q3_greeting.sh << 'EOF'
#!/bin/bash
read -p "Enter your name: " name
echo "Hello, $name! Welcome!"
EOF

chmod +x q3_greeting.sh

cat > q4_factorial.sh << 'EOF'
#!/bin/bash
read -p "Enter a number: " n
factorial=1

for (( i=1; i<=n; i++ ))
do
    factorial=$((factorial * i))
done

echo "Factorial of $n is: $factorial"
EOF

chmod +x q4_factorial.sh

cat > q5_file_check.sh << 'EOF'
#!/bin/bash

read -p "Enter directory path: " dir
read -p "Enter filename: " file

if [ -f "$dir/$file" ]
then
    echo "File exists"
else
    echo "File does not exist"
fi
EOF

chmod +x q5_file_check.sh

cat > q6_list_files.sh << 'EOF'
#!/bin/bash

read -p "Enter directory path: " dir

ls -lh "$dir" | awk 'NR>1 {print $5, $9}'
EOF

chmod +x q6_list_files.sh

cat > q7_count_lines.sh << 'EOF'
#!/bin/bash

read -p "Enter file path: " file

lines=$(wc -l < "$file")

echo "Number of lines: $lines"
EOF

chmod +x q7_count_lines.sh

cat > sample.txt << 'EOF'
I have an apple
She bought an apple pie

The apple is red

Orange is also a fruit
apple trees grow tall
EOF

cat > q8_arithmetic.sh << 'EOF'
#!/bin/bash

read -p "Enter first number: " num1
read -p "Enter second number: " num2

echo "Addition: $((num1 + num2))"
echo "Subtraction: $((num1 - num2))"
echo "Multiplication: $((num1 * num2))"

if [ $num2 -ne 0 ]
then
    echo "Division: $(echo "scale=2; $num1/$num2" | bc)"
else
    echo "Cannot divide by zero"
fi
EOF

chmod +x q8_arithmetic.sh

cat > q9_palindrome.sh << 'EOF'
#!/bin/bash

read -p "Enter a string: " str

rev_str=$(echo "$str" | rev)

if [ "$str" == "$rev_str" ]
then
    echo "Palindrome"
else
    echo "Not Palindrome"
fi
EOF

chmod +x q9_palindrome.sh

cat > q10_awk_csv.awk << 'EOF'
BEGIN { FS="," }
{ print $2 }
EOF

cat > sample.csv << 'EOF'
Name,Age,City
Alice,30,New York
Bob,25,London
Charlie,35,Paris
EOF

cat > q11_awk_sum.awk << 'EOF'
BEGIN {
FS="\t"
sum=0
}

{
sum += $3
}

END {
print sum
}
EOF

printf "Name\tCategory\tValue\nAlice\tA\t100\nBob\tB\t200\nCharlie\tC\t300\n" > sample.tsv

sed 's/apple/orange/g' sample.txt

sed '/^$/d' sample.txt

git init

git add .

git commit -m "Initial commit"

git branch -M main

git remote remove origin 2>/dev/null

git remote add origin "https://github.com/${USERNAME}/${REPO}.git"

git push -u origin main
