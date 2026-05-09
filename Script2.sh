#!/bin/bash

USERNAME="amanluthra001"
EMAIL="amanluthra804@gmail.com"
REPO="shell-scripting-assignment-part2"

echo "======================================"
echo " Shell Scripting Assignment - Part 2 "
echo "======================================"

git config --global user.name "$USERNAME"
git config --global user.email "$EMAIL"

mkdir -p $REPO
cd $REPO

cat > q1_even_odd.sh << 'EOF'
#!/bin/bash
read -p "Enter a number: " num

if (( num % 2 == 0 ))
then
    echo "$num is Even"
else
    echo "$num is Odd"
fi
EOF

chmod +x q1_even_odd.sh

cat > q2_file_permissions.sh << 'EOF'
#!/bin/bash

file=$1

if [ -z "$file" ]
then
    echo "Usage: $0 <filename>"
    exit 1
fi

[ -r "$file" ] && echo "Readable: YES" || echo "Readable: NO"
[ -w "$file" ] && echo "Writable: YES" || echo "Writable: NO"
[ -x "$file" ] && echo "Executable: YES" || echo "Executable: NO"
EOF

chmod +x q2_file_permissions.sh

cat > q3_rename_timestamp.sh << 'EOF'
#!/bin/bash

read -p "Enter directory path: " dir
read -p "Enter extension: " ext

timestamp=$(date +"%Y%m%d_%H%M%S")

for file in "$dir"/*."$ext"
do
    [ -f "$file" ] || continue

    base=$(basename "$file")

    mv "$file" "$dir/${timestamp}_${base}"

    echo "Renamed $base"
done
EOF

chmod +x q3_rename_timestamp.sh

mkdir -p test_rename

echo "file1" > test_rename/notes.txt
echo "file2" > test_rename/report.txt

cat > q4_dir_size.sh << 'EOF'
#!/bin/bash

read -p "Enter directory path: " dir

du -sh "$dir"

du -h "$dir"/* 2>/dev/null
EOF

chmod +x q4_dir_size.sh

cat > q5_find_replace.sh << 'EOF'
#!/bin/bash

read -p "Enter directory path: " dir
read -p "Find word: " find_word
read -p "Replace word: " replace_word

for file in "$dir"/*.txt
do
    [ -f "$file" ] || continue

    sed -i "s/$find_word/$replace_word/g" "$file"

    echo "Updated $(basename $file)"
done
EOF

chmod +x q5_find_replace.sh

mkdir -p test_replace

echo "I love python" > test_replace/file1.txt
echo "python is scripting" > test_replace/file2.txt

cat > q6_backup.sh << 'EOF'
#!/bin/bash

read -p "Enter source directory: " src
read -p "Enter destination directory: " dest

timestamp=$(date +"%Y%m%d_%H%M%S")

backup_name="backup_$(basename $src)_${timestamp}"

mkdir -p "$dest"

cp -r "$src" "$dest/$backup_name"

echo "Backup created"
EOF

chmod +x q6_backup.sh

mkdir -p test_backup_src
mkdir -p test_backup_dest

echo "important data" > test_backup_src/data.txt

cat > q7_disk_monitor.sh << 'EOF'
#!/bin/bash

read -p "Enter threshold: " threshold

df -h | grep -vE '^Filesystem|tmpfs|cdrom' | while read line
do
    usage=$(echo "$line" | awk '{print $5}' | tr -d '%')
    mount=$(echo "$line" | awk '{print $6}')

    echo "$mount : ${usage}%"

    if [ "$usage" -ge "$threshold" ]
    then
        echo "ALERT"
    fi
done
EOF

chmod +x q7_disk_monitor.sh

cat > q8_extract_emails.sh << 'EOF'
#!/bin/bash

read -p "Enter file path: " file

grep -oE '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' "$file" | sort -u
EOF

chmod +x q8_extract_emails.sh

cat > emails_sample.txt << 'EOF'
john@gmail.com
alice@yahoo.com
bob@test.com
EOF

cat > q9_ping_check.sh << 'EOF'
#!/bin/bash

read -p "Enter IP or hostname: " ip

if ping -c 3 -W 2 "$ip" > /dev/null 2>&1
then
    echo "Reachable"
else
    echo "Not Reachable"
fi
EOF

chmod +x q9_ping_check.sh

cat > q10_sort_dedup.sh << 'EOF'
#!/bin/bash

read -p "Enter input file: " file
read -p "Enter output file: " outfile

sort -u "$file" > "$outfile"

cat "$outfile"
EOF

chmod +x q10_sort_dedup.sh

cat > sort_sample.txt << 'EOF'
banana
apple
banana
orange
apple
EOF

cat > q11_random_password.sh << 'EOF'
#!/bin/bash

read -p "Enter password length: " length

password=$(cat /dev/urandom | tr -dc 'A-Za-z0-9' | head -c "$length")

echo "$password"
EOF

chmod +x q11_random_password.sh

cat > q12_find_symlinks.sh << 'EOF'
#!/bin/bash

read -p "Enter directory path: " dir

find "$dir" -type l
EOF

chmod +x q12_find_symlinks.sh

ln -sf q2_file_permissions.sh test_symlink.sh

cat > q13_recursive_search.sh << 'EOF'
#!/bin/bash

read -p "Enter directory: " dir
read -p "Enter search string: " str

grep -rl "$str" "$dir"
EOF

chmod +x q13_recursive_search.sh

git init

git add .

git commit -m "Initial commit"

git branch -M main

git remote remove origin 2>/dev/null

git remote add origin "https://github.com/${USERNAME}/${REPO}.git"

echo ""
echo "Repository ready for GitHub Desktop upload"
