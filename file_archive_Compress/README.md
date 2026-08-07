# Linux Archives and Compression - Complete Guide

---

# 1. Introduction

Linux separates **archiving** from **compression**.

These are two different operations.

```
Files
  │
  ├── Archive (Combine)
  │
  └── Compression (Reduce Size)
```

```
tar = Archive only

gzip = Compression only

zip = Archive + Compression
```

---

# 2. What is an Archive?

An archive combines multiple files and directories into one file.

Example

```
Documents/
images/
notes.txt
video.mp4
```

↓

```
backup.tar
```

Notice:

Nothing became smaller.

Only combined into one file.

It's like putting many books into one box. which is easy to carry and transfer but the books are of same size.

---

# Advantages

- Easier to transfer
- Easier to backup
- Preserves directory structure
- Preserves permissions
- Preserves timestamps
- Preserves symbolic links
- Preserves ownership (when supported)

---

# 3. What is Compression?

Compression reduces file size.

Example

```
movie.mp4
100 MB
```

↓

```
movie.mp4.gz
70 MB
```

Compression makes files occupy less storage.

---

# Advantages

- Saves disk space
- Faster network transfer
- Smaller backups

---

# 4. Archive vs Compression

| Feature | Archive | Compression |
|----------|----------|------------|
| Combines files | Yes | No |
| Reduces size | No | Yes |
| Preserves folders | Yes | No |
| Example | tar | gzip |

---

# 5. Common Archive Formats

```
.tar
.zip
.cpio
.ar
```

Most common

```
.tar
.zip
```

---

# 6. Common Compression Formats

```
.gz
.bz2
.xz
.zst
```

---

# 7. Archive + Compression Formats

```
.tar.gz
.tgz
.tar.bz2
.tar.xz
.tar.zst
.zip
```

Notice

```
.tar.gz

means

Archive
↓

Compression
```

---

# 8. tar Command

tar means

```
Tape Archive
```

Originally designed for tape backups.

Today it archives files.

Basic syntax

```bash
tar [options] archive_name files
```

---

## Create Archive

```bash
tar -cf backup.tar Documents/
```

Options

```
-c => Create archive
```

```
-f => Archive filename
```

Result

```
backup.tar
```

---

## Extract Archive

```bash
tar -xf backup.tar
```

Options

```
-x => Extract
```

---

## List Archive

```bash
tar -tf backup.tar
```

Shows

```
Documents/
Documents/file1.txt
Documents/file2.txt
```

---

## Verbose Output

```bash
tar -cvf backup.tar Documents/
```

```
-v => Verbose Shows every file
```

---

# 9. gzip Command

gzip compresses ONE file only.

Example

```bash
gzip report.txt
```

Result

```
report.txt.gz
```

Original

```
report.txt
```

becomes

```
report.txt.gz
```

unless `-k` is used to keep the original.

---

Keep original

```bash
gzip -k report.txt
```

Now both exist

```
report.txt

report.txt.gz
```

---

# 10. gunzip Command

Decompress gzip

```bash
gunzip report.txt.gz
```

Equivalent

```bash
gzip -d report.txt.gz
```

---

# 11. bzip2

Better compression than gzip

Slower

Compress

```bash
bzip2 file.txt
```

Result

```
file.txt.bz2
```

Extract

```bash
bunzip2 file.txt.bz2
```

---

# 12. xz

Very high compression

Compress

```bash
xz file.txt
```

Result

```
file.txt.xz
```

Extract

```bash
unxz file.txt.xz
```

---

# 13. zip Command

zip Archives AND Compresses at the same time.

Create

```bash
zip archive.zip file1.txt file2.txt
```

Directory

```bash
zip -r project.zip project/
```

```
-r

Recursive
```

---

# 14. unzip Command

Extract

```bash
unzip archive.zip
```

Extract to directory

```bash
unzip archive.zip -d output/
```

List

```bash
unzip -l archive.zip
```

---

# 15. Creating Archives

Only archive

```bash
tar -cf backup.tar folder/
```

Archive + gzip

```bash
tar -czf backup.tar.gz folder/
```

Archive + bzip2

```bash
tar -cjf backup.tar.bz2 folder/
```

Archive + xz

```bash
tar -cJf backup.tar.xz folder/
```

---

# 16. Extracting Archives

tar

```bash
tar -xf backup.tar
```

tar.gz

```bash
tar -xzf backup.tar.gz
```

tar.bz2

```bash
tar -xjf backup.tar.bz2
```

tar.xz

```bash
tar -xJf backup.tar.xz
```

zip

```bash
unzip archive.zip
```

---

# 17. Viewing Archive Contents

tar

```bash
tar -tf backup.tar
```

tar.gz

```bash
tar -tzf backup.tar.gz
```

zip

```bash
unzip -l archive.zip
```

---

# 18. Extract Specific File

tar

```bash
tar -xf backup.tar Documents/report.pdf
```

zip

```bash
unzip archive.zip report.pdf
```

---

# 19. Compression Levels

gzip

```
-1

Fastest
Least compression
```

```
-9

Slowest
Maximum compression
```

Example

```bash
gzip -9 file.txt
```

Default

```
-6
```

---

# 20. File Permissions

tar preserves

- permissions
- ownership (when possible)
- timestamps
- symbolic links
- directory structure

zip preserves many attributes, but behavior may differ across operating systems and tools.

---

# 21. Symbolic Links

tar

Stores symlinks correctly by default.

zip

May store symbolic links differently depending on platform and implementation.

---

# 22. Common tar Options

| Option | Meaning |
|----------|---------|
| -c | Create archive |
| -x | Extract |
| -t | List contents |
| -f | Archive filename |
| -v | Verbose |
| -z | gzip |
| -j | bzip2 |
| -J | xz |
| -a | Auto-detect compression based on archive extension (GNU tar) |
| -C | Change extraction directory |
| --exclude | Skip matching files/directories |

---

Example

```bash
tar -xzf backup.tar.gz -C /tmp
```

---

Exclude

```bash
tar --exclude='*.log' -czf backup.tar.gz project/
```

---

# 23. Common zip Options

| Option | Meaning |
|----------|---------|
| -r | Recursive |
| -9 | Best compression |
| -0 | No compression |
| -q | Quiet |
| -e | Encrypt (legacy ZIP encryption) |
| -j | Junk directory names (store only file names) |

---

Example

```bash
zip -r backup.zip project/
```

---

# 24. Real World Examples

Backup Home

```bash
tar -czf home_backup.tar.gz ~/Documents
```

Extract

```bash
tar -xzf home_backup.tar.gz
```

Archive Logs

```bash
tar -czf logs.tar.gz /var/log
```

Compress Single File

```bash
gzip database.sql
```

Extract ZIP

```bash
unzip workarea.zip -d new_dir
```

---

# 25. Best Practices

Use

```
tar.gz

for Linux backups
```

Use

```
zip

for Windows compatibility
```

Use

```
xz

for maximum compression
```

Use

```
gzip

for speed
```

Always verify an archive after creating it by listing its contents:

```bash
tar -tf backup.tar
```

or

```bash
unzip -l archive.zip
```

---

# 26. Important Notes

### 1. tar does NOT compress.

```
tar == Archive
```

---

### 2. gzip does NOT archive.

```
gzip == Compress
```

---

### 3. zip archives and compresses.

```
zip == Archive + Compress
```

---

### 4. gzip compresses one file only.

If you have

```
100 files
```

You usually

```
tar

↓

gzip
```

---

## 5.

.tar.gz

means

```
tar

↓

gzip
```

NOT

```
gzip

↓

tar
```

The order matters.

---

## 6.

Do not rename extensions manually.

Wrong

```
backup.tar

↓

backup.zip
```

The file format has not changed.

---

### 7. Compression effectiveness depends on file type.

Text files compress well.

```
txt, csv, json, xm, log, source code
```

Images

```
jpg, png, gif
```

usually compress very little because they are already compressed.

Videos

```
mp4, mkv, avi
```

also compress very little.

---

### 8. Compressed files cannot be used directly.

They must be decompressed before normal access (unless an application supports reading compressed files).

---

### 9. Archives are commonly used for

- backups
- software distribution
- source code
- configuration files
- log storage

---

## 11.

For extraction, use `-C` to choose the destination directory.

```bash
mkdir output
tar -xzf backup.tar.gz -C output
```

---

### 12. To create a compressed archive while excluding files:

```bash
tar --exclude='*.tmp' --exclude='node_modules' -czf project.tar.gz project/
```

---
---

```
tar
↓
Bundles files together
(No compression)

gzip
↓
Compresses one file

tar + gzip
↓
Bundles multiple files
then compresses the archive

zip
↓
Bundles multiple files
and compresses them in one step
```