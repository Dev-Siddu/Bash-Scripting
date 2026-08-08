# Symbolic Links in Linux

## 1. What Is a Symbolic Link?

A **symbolic link (symlink)** is a special filesystem object that points to another file or directory.

It is similar to a shortcut.

Example:

```text
project/
├── mainfiles/
│   └── input.txt
└── linkfiles/
    └── input_link -> ../mainfiles/input.txt
```

Here:

- `input.txt` is the original/target file.
- `input_link` is the symbolic link.
- `input_link` points to `input.txt`.

When you access `input_link`, Linux follows the link and accesses `input.txt`.

---

## 2. Why Use Symbolic Links?

Symbolic links are useful when:

- You want multiple paths to access the same file.
- You don't want to copy a large file.
- You want a shortcut to a directory.
- You want applications to use a fixed path.
- You want to change the actual target without changing every reference to it.

Example:

```text
/opt/application/current -> /opt/application/v2.5
```

Later:

```text
/opt/application/current -> /opt/application/v2.6
```

The application can continue using:

```text
/opt/application/current
```

---

## 3. Creating a Symbolic Link

The basic syntax is:

```bash
ln -s TARGET LINK_NAME
```

Where:

- `ln` = link command
- `-s` = create a symbolic link
- `TARGET` = file or directory to point to
- `LINK_NAME` = name of the symbolic link

Example:

```bash
ln -s input.txt input_link
```

Result:

```text
input_link -> input.txt
```

---

## 4. Symbolic Link to a File

Suppose the directory structure is:

```text
project/
├── mainfiles/
│   └── input.txt
└── linkfiles/
```

You want:

```text
linkfiles/input_link -> ../mainfiles/input.txt
```

Use:

```bash
ln -s ../mainfiles/input.txt ./linkfiles/input_link
```

Result:

```text
project/
├── mainfiles/
│   └── input.txt
└── linkfiles/
    └── input_link -> ../mainfiles/input.txt
```

---

## 5. Symbolic Link to a Directory

A symbolic link can also point to a directory.

```bash
ln -s ../mainfiles/workarea ./linkfiles/dir_link
```

---

## 6. The Most Important Rule: Relative Paths

A **relative target stored inside a symbolic link is interpreted relative to the directory containing the symbolic link**.
```

## 8. Absolute Symbolic Links

You can also use an absolute path:

```bash
ln -s /home/user/project/mainfiles/input.txt ./linkfiles/input_link
```

The link stores:

```text
/home/user/project/mainfiles/input.txt
```

Advantages:

- Explicit.
- Useful when the target must always be at a specific absolute location.

Disadvantage:

If the target is moved, the symbolic link becomes broken.

---

## 9. How to Identify a Symbolic Link

Use:

```bash
ls -l
```

Example:

```text
lrwxrwxrwx 1 user user 25 Aug 8 09:00 input_link -> ../mainfiles/input.txt
```

The first character is:

```text
l
```

The `l` means the entry is a symbolic link.

The arrow:

```text
->
```

shows what the link points to.

---

## 10. Check Whether a Path Is a Symbolic Link

In Bash:

```bash
[ -L "$file" ]
```

Example:

```bash
if [ -L "$file" ]; then
    echo "It is a symbolic link."
else
    echo "It is not a symbolic link."
fi
```

`-L` means:

> Check whether the specified path is a symbolic link.

---

## 11. Difference Between `-L` and `-e`

### `-L`

Checks whether the path is a symbolic link:

```bash
[ -L "$file" ]
```

### `-e`

Checks whether the path exists:

```bash
[ -e "$file" ]
```

```text
-L  = Is this a symbolic link?
-e  = Does this path currently exist?
```

---

## 12. Get the Target of a Symbolic Link

Use:

```bash
readlink "$link"
```

Example:

```bash
readlink ./linkfiles/input_link
```

Output:

```text
../mainfiles/input.txt
```

---

## 13. Get the Absolute Target Path

Use:

```bash
readlink -f "$link"
```

Example:

```bash
readlink -f ./linkfiles/input_link
```

```text
readlink       -> shows the stored target
readlink -f    -> resolves the target to an absolute path
```
---

## 18. Deleting a Symbolic Link

Use:

```bash
rm link_name
```
---

## 19. Broken Symbolic Links

A symbolic link becomes **broken** when its target no longer exists.


```bash
if [ -L "$link" ] && [ ! -e "$link" ]; then
    echo "Broken symbolic link"
fi
```
Meaning:

```text
-L       -> it is a symbolic link
! -e     -> its target/path does not exist
```

---


## 25. Replacing an Existing Symbolic Link

If you intentionally want to replace an existing symbolic link:

```bash
ln -sfn ../mainfiles/input.txt ./linkfiles/input_link
```

Options:

```text
-s  create symbolic link
-f  force replacement
-n  treat destination symlink as a link instead of following it
```

Use this carefully because `-f` can replace an existing filesystem entry.

---

## 26. Symbolic Link vs Hard Link

Linux has two common types of links:

1. Symbolic link
2. Hard link

### Symbolic Link

Created using:

```bash
ln -s TARGET LINK
```

A symbolic link stores a path to the target.

Example:

```text
input_link -> ../mainfiles/input.txt
```

### Hard Link

Created using:

```bash
ln TARGET LINK
```

Example:

```bash
ln input.txt input_hardlink
```

A hard link refers to the same underlying inode as the original file.

---

## 27. Symbolic Link vs Hard Link

| Feature | Symbolic Link | Hard Link |
|---|---|---|
| Command | `ln -s` | `ln` |
| Refers to | Path | Same inode |
| Can point to directory | Yes | Generally no |
| Can cross filesystems | Yes | No |
| Can become broken | Yes | No, as long as another hard link exists |
| Has separate inode | Yes | No |
| Can use relative path | Yes | No |
| Can use absolute path | Yes | Not applicable |
| Commonly used as shortcut | Yes | No |

For normal shortcut/reference purposes, symbolic links are usually what you need.

---

## 28. Symbolic Link vs Copy

Consider:

```text
original.txt
link.txt -> original.txt
copy.txt
```

`link.txt` is a symbolic link.

`copy.txt` is a separate file.

If you modify:

```text
original.txt
```

then:

```text
link.txt
```

sees the modification because it points to the original.

But:

```text
copy.txt
```

does not automatically change.

---

# 31. Symbolic Link Cheat Sheet

| Command | Purpose |
|---|---|
| `ln -s TARGET LINK` | Create symbolic link |
| `ls -l LINK` | Show link and target |
| `readlink LINK` | Show stored target |
| `readlink -f LINK` | Resolve target to absolute path |
| `[ -L LINK ]` | Check whether it is a symbolic link |
| `[ -e LINK ]` | Check whether the path exists |
| `rm LINK` | Delete symbolic link |
| `find . -type l` | Find symbolic links recursively |
| `find . -type l ! -exec test -e {} \; -print` | Find broken symbolic links |
| `ln -sfn TARGET LINK` | Replace an existing symbolic link |
