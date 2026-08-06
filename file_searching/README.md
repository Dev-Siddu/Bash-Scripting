# Linux File Searching & Bash Scripting

---

# 1. `stat` - Display File Information

Shows detailed information about a file.

## Syntax

```bash
stat <filename>
```

### Example

```bash
stat test.txt
```

### Output

```text
File: test.txt
Size: 256
Access: 2026-08-06
Modify: 2026-08-05
Change: 2026-08-05
```

### Common Use Cases

- Check file size
- Last modified time
- Permissions
- Inode number
- File owner

### Useful Options

```bash
stat -c %s file.txt      # File size
stat -c %y file.txt      # Modified time
stat -c %U file.txt      # Owner
stat -c %a file.txt      # Permission
```

---

# 2. `find` - Search Files and Directories

The most powerful Linux file searching command.

## Syntax

```bash
find <path> <options> <expression>
```

---

## Search by Name

```bash
find /home -name "test.txt"
```

Case insensitive:

```bash
find /home -iname "test.txt"
```

---

## Search by Extension

```bash
find . -name "*.log"
```

---

## Search Directories

```bash
find . -type d
```

---

## Search Files

```bash
find . -type f
```

---

## Search Empty Files

```bash
find . -type f -empty
```

---

## Search Empty Directories

```bash
find . -type d -empty
```

---

## Search by Size

Greater than 100 MB

```bash
find / -size +100M
```

Less than 10 KB

```bash
find . -size -10k
```

Exactly 5 GB

```bash
find . -size 5G
```

---

## Search by Permissions

```bash
find . -perm 644
```

Executable files

```bash
find . -perm /111
```

---

## Search by Owner

```bash
find /home -user john
```

---

## Search by Group

```bash
find / -group developers
```

---

## Search Recently Modified Files

Modified within last 7 days

```bash
find . -mtime -7
```

Modified exactly 2 days ago

```bash
find . -mtime 2
```

Modified more than 30 days ago

```bash
find . -mtime +30
```

---

## Search by Access Time

```bash
find . -atime -2
```

---

## Search by Change Time

```bash
find . -ctime -5
```

---

## Execute Command on Results

Delete log files

```bash
find . -name "*.log" -delete
```

Compress files

```bash
find . -name "*.txt" -exec gzip {} \;
```

Change permissions

```bash
find . -type f -exec chmod 644 {} \;
```

---

## Search Multiple File Types

```bash
find . \( -name "*.log" -o -name "*.txt" \)
```

---

## Exclude Directory

```bash
find . -path "./backup" -prune -o -name "*.txt" -print
```

---

# 3. `grep` - Search Text Inside Files

Search for matching patterns inside files.

## Syntax

```bash
grep [options] pattern file
```

---

## Basic Search

```bash
grep "error" app.log
```

---

## Ignore Case

```bash
grep -i "error" app.log
```

---

## Recursive Search

```bash
grep -r "password" /etc
```

---

## Show Line Numbers

```bash
grep -n "root" /etc/passwd
```

---

## Count Matches

```bash
grep -c "ERROR" logfile.log
```

---

## Invert Match

Show lines NOT containing a word.

```bash
grep -v "INFO" logfile.log
```

---

## Search Multiple Files

```bash
grep "failed" *.log
```

---

## Match Whole Word

```bash
grep -w "root" /etc/passwd
```

---

## Extended Regular Expression

```bash
grep -E "error|warning" app.log
```

---

## Print Only Matching Text

```bash
grep -o "[0-9]\+" file.txt
```

---

## Common Real-Time Examples

Find failed SSH logins

```bash
grep "Failed password" /var/log/auth.log
```

Search Java exceptions

```bash
grep -r "Exception" logs/
```

Search IP addresses

```bash
grep -E "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" file.txt
```

---

# 4. `locate` - Fast File Search

Searches files using a pre-built database.

## Syntax

```bash
locate filename
```

Example

```bash
locate sshd_config
```

---

## Update Database

```bash
sudo updatedb
```

---

## Ignore Case

```bash
locate -i README
```

---

## Limit Results

```bash
locate -n 5 passwd
```

---

## Difference Between `find` and `locate`

| find | locate |
|------|---------|
| Searches filesystem | Searches database |
| Slower | Very fast |
| Real-time | Database may be outdated |
| Many filters | Limited filters |

---

# 5. `which`

Shows executable location.

```bash
which python
```

Output

```text
/usr/bin/python
```

---

# 6. `whereis`

Find executable, source, and man pages.

```bash
whereis bash
```

---

# 7. `type`

Shows how a command is interpreted.

```bash
type ls
```

Output

```text
ls is aliased to ls --color=auto
```

---

# 8. `basename`

Removes directory path.

```bash
basename /home/user/file.txt
```

Output

```text
file.txt
```

---

# 9. `dirname`

Returns directory portion.

```bash
dirname /home/user/file.txt
```

Output

```text
/home/user
```

---

# 10. Bash Parameter Expansion

Parameter expansion is heavily used in shell scripting for manipulating variables.

---

## `${variable#pattern}`

Removes the **shortest** matching prefix.

```bash
file="/home/user/test.txt"

echo ${file#/}
```

Output

```text
home/user/test.txt
```

Example

```bash
path="/usr/local/bin/bash"

echo ${path#*/}
```

Output

```text
local/bin/bash
```

---

## `${variable##pattern}`

Removes the **longest** matching prefix.

```bash
path="/usr/local/bin/bash"

echo ${path##*/}
```

Output

```text
bash
```

Common Use

Extract filename

```bash
file="/home/user/report.pdf"

echo ${file##*/}
```

Output

```text
report.pdf
```

---

## `${variable%pattern}`

Removes the shortest matching suffix.

```bash
file="backup.tar.gz"

echo ${file%.*}
```

Output

```text
backup.tar
```

---

## `${variable%%pattern}`

Removes the longest matching suffix.

```bash
file="backup.tar.gz"

echo ${file%%.*}
```

Output

```text
backup
```

---

## `${variable##*.}`

Extract file extension.

```bash
file="image.png"

echo ${file##*.}
```

Output

```text
png
```

---

## `${variable%/*}`

Get directory path.

```bash
file="/home/user/test.txt"

echo ${file%/*}
```

Output

```text
/ home/user
```

---

## `${variable##*/}`

Get filename.

```bash
file="/home/user/test.txt"

echo ${file##*/}
```

Output

```text
test.txt
```

---

## `${#variable}`

Length of string.

```bash
name="Linux"

echo ${#name}
```

Output

```text
5
```

---

## Replace String

Replace first occurrence

```bash
echo ${file/.txt/.csv}
```

Replace all occurrences

```bash
echo ${text//old/new}
```

---

## Default Value

```bash
echo ${USER:-guest}
```

---

## Assign Default Value

```bash
echo ${USER:=guest}
```

---

## Check Variable Exists

```bash
echo ${USER:?Variable not set}
```

---

# Real-Time Examples

## Find all log files modified today

```bash
find /var/log -name "*.log" -mtime -1
```

---

## Search for "ERROR" in logs

```bash
grep -r "ERROR" /var/log
```

---

## Find files larger than 1 GB

```bash
find / -size +1G
```

---

## Find and delete old backup files

```bash
find /backup -name "*.bak" -mtime +30 -delete
```

---

## Locate SSH configuration

```bash
locate sshd_config
```

---

## Extract filename from path

```bash
path="/opt/scripts/deploy.sh"

echo ${path##*/}
```

Output

```text
deploy.sh
```

---

## Extract directory from path

```bash
echo ${path%/*}
```

Output

```text
/opt/scripts
```

---

# Quick Reference

| Command | Purpose |
|----------|---------|
| `stat file` | File metadata |
| `find` | Search files/directories |
| `grep` | Search text inside files |
| `locate` | Fast filename search |
| `which` | Executable location |
| `whereis` | Binary, source, man pages |
| `type` | Command type |
| `basename` | Filename only |
| `dirname` | Directory only |
| `${var#pattern}` | Remove shortest prefix |
| `${var##pattern}` | Remove longest prefix |
| `${var%pattern}` | Remove shortest suffix |
| `${var%%pattern}` | Remove longest suffix |
| `${#var}` | String length |
| `${var//old/new}` | Replace all occurrences |