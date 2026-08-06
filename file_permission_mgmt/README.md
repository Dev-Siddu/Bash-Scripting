# Linux File Permission Management

Linux uses a permission system to control who can read, write, and execute files and directories. Proper permission management is essential for system security, user management, and protecting sensitive data.

---

# 1. Understanding Linux File Permissions

Every file and directory in Linux has three types of permissions:

| Permission | Symbol | Meaning |
|------------|--------|---------|
| Read | r | View file contents or list directory contents |
| Write | w | Modify file contents or create/delete files |
| Execute | x | Run a file or access a directory |

Example:

```bash
-rwxr-xr--
```

Permission breakdown:

```
-   rwx   r-x   r--
|    |     |     |
|    |     |     |
|    |     |     └── Others permissions
|    |     └──────── Group permissions
|    └────────────── Owner permissions
└────────────────── File type
```

---

# 2. File Type Indicators

The first character represents the file type.

| Symbol | Type |
|--------|------|
| - | Regular file |
| d | Directory |
| l | Symbolic link |
| c | Character device |
| b | Block device |
| s | Socket |
| p | Named pipe |

Example:

```bash
drwxr-xr-x
```

`d` means it is a directory.

---

# 3. Permission Groups

Linux permissions are divided into three categories:

| Category | Symbol | Applies To |
|----------|--------|------------|
| User | u | File owner |
| Group | g | Users belonging to the file group |
| Others | o | Everyone else |
| All | a | User + Group + Others |

Example:

```
-rwxr-xr--
```

Meaning:

| User | Permission |
|------|------------|
| Owner | rwx |
| Group | r-x |
| Others | r-- |

---

# 4. Checking File Permissions

Use:

```bash
ls -l
```

Example output:

```bash
-rw-r--r-- 1 john developers 1200 file.txt
```

Explanation:

```
-rw-r--r--
│││ │││ │││
│││ │││ │└── Others permissions
│││ ││└───── Group permissions
│││ └─────── Owner permissions
│└────────── File type
```

---

# 5. Permission Values (Numeric Mode)

Linux converts permissions into numbers.

| Permission | Value |
|------------|-------|
| Read (r) | 4 |
| Write (w) | 2 |
| Execute (x) | 1 |
| No permission | 0 |

Calculation:

```
rwx = 4+2+1 = 7
rw- = 4+2+0 = 6
r-x = 4+0+1 = 5
r-- = 4+0+0 = 4
```

Common permission examples:

| Numeric | Symbolic | Usage |
|---------|----------|-------|
| 777 | rwxrwxrwx | Everyone full access |
| 755 | rwxr-xr-x | Common executable files |
| 644 | rw-r--r-- | Common files |
| 600 | rw------- | Private files |
| 700 | rwx------ | Private executable |

---

# 6. Changing File Permissions (chmod)

Command:

```bash
chmod permission filename
```

Example:

```bash
chmod 755 script.sh
```

Result:

```
rwxr-xr-x
```

---

# 7. Symbolic chmod Method

Instead of numbers, use symbols.

Syntax:

```bash
chmod [who][operator][permission] file
```

Operators:

| Operator | Meaning |
|----------|---------|
| + | Add permission |
| - | Remove permission |
| = | Set permission |

---

# 8. Changing File Ownership (chown)

Files have an owner and group.

Command:

```bash
chown user file
```

Example:

```bash
chown john report.txt
```

Change owner and group:

```bash
chown john:developers report.txt
```

Check ownership:

```bash
ls -l
```

---

# 9. Changing Group Ownership (chgrp)

Command:

```bash
chgrp group file
```

Example:

```bash
chgrp developers project.txt
```

---

# 10. Directory Permissions

Directory permissions behave differently from files.

| Permission | File | Directory |
|------------|------|-----------|
| Read | View content | List files |
| Write | Modify content | Create/delete files |
| Execute | Run file | Enter/access directory |

Example:

```bash
chmod 755 /data
```

Means:

```
Owner  : Read + Write + Execute
Group  : Read + Execute
Others : Read + Execute
```

---

# 12. Default Permissions (umask)

`umask` controls default permissions for newly created files.

Check current umask:

```bash
umask
```

Example:

```bash
0022
```

Default calculation:

Files:

```
666 - umask
```

Directories:

```
777 - umask
```

Example:

```
File:
666 - 022 = 644

Directory:
777 - 022 = 755
```

Set temporary umask:

```bash
umask 027
```

Permanent configuration:

```bash
~/.bashrc
```

or

```bash
/etc/profile
```

---

# 13. Special Permissions

Linux has three special permissions:

1. SUID
2. SGID
3. Sticky Bit

---

# 14. SUID (Set User ID)

SUID allows a user to execute a file with the owner's privileges.

Symbol:

```
s
```

Example:

```bash
chmod u+s program
```

Numeric:

```bash
chmod 4755 program
```

Example:

```
-rwsr-xr-x
```

Common example:

```bash
/usr/bin/passwd
```

The passwd command runs with root privileges.

---

# 15. SGID (Set Group ID)

SGID allows files created inside a directory to inherit the directory group.

Enable:

```bash
chmod g+s directory
```

Numeric:

```bash
chmod 2775 directory
```

Example:

```
drwxrwsr-x
```

Useful for shared project folders.

---

# 16. Sticky Bit

Sticky bit prevents users from deleting files owned by others inside a directory.

Enable:

```bash
chmod +t directory
```

Numeric:

```bash
chmod 1777 directory
```

Example:

```
drwxrwxrwt
```

Common example:

```bash
/tmp
```

---

# 17. Access Control Lists (ACL)

ACL provides advanced permissions beyond normal Linux permissions.

Install tools:

```bash
sudo apt install acl
```

View ACL:

```bash
getfacl filename
```

Add ACL permission:

```bash
setfacl -m u:john:rwx file.txt
```

Remove ACL:

```bash
setfacl -x u:john file.txt
```

Remove all ACL:

```bash
setfacl -b file.txt
```

---

# 18. Recursive Permission Changes

Apply permissions to directories and contents:

```bash
chmod -R 755 directory/
```

Change ownership recursively:

```bash
chown -R user:group directory/
```

Be careful when using recursive commands.

---

# 19. Finding Files With Specific Permissions

Find world-writable files:

```bash
find / -perm -002
```

Find SUID files:

```bash
find / -perm -4000
```

Find SGID files:

```bash
find / -perm -2000
```

Find files owned by a user:

```bash
find / -user username
```
---

## Use Minimum Required Permissions

Follow:

```
Least Privilege Principle
```

Give only required access.

---

# 23. Important Permission Commands Summary

| Command | Purpose |
|---------|---------|
| ls -l | View permissions |
| chmod | Change permissions |
| chown | Change owner |
| chgrp | Change group |
| umask | Default permissions |
| getfacl | View ACL |
| setfacl | Modify ACL |
| find | Search permission-based files |

---

# 24. Quick Permission Reference

```
7 = rwx
6 = rw-
5 = r-x
4 = r--
3 = -wx
2 = -w-
1 = --x
0 = ---
```

Common:

```
755 → Programs and directories
644 → Normal files
600 → Private files
700 → Private directories
775 → Shared team directories
```