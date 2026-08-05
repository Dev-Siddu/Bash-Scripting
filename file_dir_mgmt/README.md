# File & Directory Management (Linux)

A quick reference for the most commonly used Linux commands to create, copy, move, rename, delete, and manage files and directories.

---

# Create

## Create a file

```bash
touch file.txt
```

## Create multiple files

```bash
touch file1.txt file2.txt file3.txt
```

## Create a directory

```bash
mkdir mydir
```

## Create multiple directories

```bash
mkdir dir1 dir2 dir3
```

## Create nested directories

```bash
mkdir -p project/src/components
```

> ⭐ **Important:** `-p` creates parent directories if they don't exist and doesn't fail if they already exist.

---

# 📄 Copy

## Copy a file

```bash
cp source.txt destination.txt
```

## Copy multiple files

```bash
cp file1 file2 destination/
```

## Copy a directory

```bash
cp -R project backup/
```

> ⭐ **Remember:** Use `-R` (or `-r`) to copy directories.

## Preserve permissions & timestamps

```bash
cp -a source destination
```

> ⭐ `-a` (archive) is preferred when copying complete directories.

---

# 🚚 Move / Rename

## Move a file

```bash
mv file.txt /home/user/Documents/
```

## Rename a file

```bash
mv old.txt new.txt
```

## Rename a directory

```bash
mv old_dir new_dir
```

---

# ❌ Delete

## Delete a file

```bash
rm file.txt
```

## Delete multiple files

```bash
rm file1 file2 file3
```

## Delete files using wildcards

```bash
rm error*
```

Deletes all files whose names start with `error`.

## Delete an empty directory

```bash
rmdir mydir
```

## Delete a directory recursively

```bash
rm -r project
```

## Force delete

```bash
rm -rf project
```

> ⚠️ **Be very careful with `rm -rf`. Deleted files cannot be recovered easily.**

---

# 👀 View Files & Directories

## List files

```bash
ls
```

## Detailed list

```bash
ls -l
```

## Show hidden files

```bash
ls -a
```

## Human-readable sizes

```bash
ls -lh
```

---

# Search

## Find a file

```bash
find . -name "file.txt"
```

## Find directories

```bash
find . -type d
```

## Find files

```bash
find . -type f
```

---

# Check Disk Usage

## Size of a directory

```bash
du -sh directory
```

## Disk usage

```bash
df -h
```

---

# 🔐 Permissions

## Change permissions

```bash
chmod 755 script.sh
```

## Make a script executable

```bash
chmod +x script.sh
```

## Change ownership

```bash
chown user:user file.txt
```

---

# 🧩 Wildcards

| Pattern | Meaning |
|----------|---------|
| `*` | Matches zero or more characters |
| `?` | Matches exactly one character |
| `[abc]` | Matches one character from the set |
| `[0-9]` | Matches a digit |

Examples:

```bash
rm *.txt
```

```bash
cp image?.png backup/
```

```bash
ls file[1-5].txt
```

---

# ⭐ Commands to Remember

```bash
pwd
ls -lah
cd
mkdir -p
touch
cp -R
cp -a
mv
rmdir
rm
rm -r
rm -rf
find
chmod +x
du -sh
df -h
```

---

# ⚠️ Common Mistakes

- Never run `rm -rf` without verifying the path.
- Use `mkdir -p` instead of `mkdir` for nested directories.
- Use `cp -a` when copying projects to preserve metadata.
- Always quote filenames containing spaces.

```bash
rm "my file.txt"
```

```bash
cp "My Project" backup/
```

---

# 💡 Best Practices

- Use meaningful file and directory names.
- Verify with `ls` before deleting files.
- Test commands on sample files before using `rm -rf`.
- Prefer `cp -a` for backups.
- Quote paths containing spaces.
