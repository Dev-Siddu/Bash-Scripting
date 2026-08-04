# Loops in Bash Scripting

Loops are used to execute a block of code repeatedly based on a condition or a list of values.

---

# 1. for Loop

### Purpose
Used when iterating over a list, sequence, array, files, or command output.

### Syntax

```bash
for variable in list
do
    commands
done
```

### Example

```bash
for name in Alice Bob Charlie
do
    echo "$name"
done
```

> **Important**
> - Best when the number of iterations or items is known.
> - The loop variable holds the current item in each iteration.
> - Quote variables (`"$variable"`) to prevent word splitting.

---

# 2. while Loop

### Purpose
Executes commands **while the condition is true**.

### Syntax

```bash
while condition
do
    commands
done
```

### Example

```bash
count=1

while [ $count -le 3 ]
do
    echo "$count"
    ((count++))
done
```

> **Important**
> - Condition is checked **before** each iteration.
> - Ensure the condition eventually becomes false to avoid an infinite loop.

---

# 3. until Loop

### Purpose
Executes commands **until the condition becomes true** (runs while the condition is false).

### Syntax

```bash
until condition
do
    commands
done
```

### Example

```bash
count=1

until [ $count -gt 3 ]
do
    echo "$count"
    ((count++))
done
```

> **Important**
> - Opposite of the `while` loop.
> - Commonly used for retry operations or waiting for a condition.

---

# 4. select Loop

### Purpose
Creates a numbered menu for user selection.

### Syntax

```bash
select variable in list
do
    commands
done
```

### Example

```bash
select fruit in Apple Mango Orange
do
    echo "You selected $fruit"
    break
done
```

> **Important**
> - Used only in **interactive** shell scripts.
> - Continues displaying the menu until terminated.

---

# Loop Control Statements

## break

### Purpose
Terminates the current loop immediately.

### Syntax

```bash
break
```

### Example

```bash
for i in 1 2 3 4 5
do
    [ "$i" -eq 3 ] && break
    echo "$i"
done
```

> **Important:** Exits only the nearest enclosing loop.

---

## continue

### Purpose
Skips the remaining commands in the current iteration and starts the next iteration.

### Syntax

```bash
continue
```

### Example

```bash
for i in 1 2 3 4 5
do
    [ "$i" -eq 3 ] && continue
    echo "$i"
done
```

> **Important:** Does **not** terminate the loop.

---

# Infinite Loop

### Syntax

```bash
while true
do
    commands
done
```

or

```bash
for (( ; ; ))
do
    commands
done
```

> **Important**
> - Always provide a termination mechanism (`break`, signal, or user input).
> - Avoid accidental infinite loops.

---

# Nested Loops

### Purpose
A loop inside another loop.

### Syntax

```bash
for variable1 in list1
do
    for variable2 in list2
    do
        commands
    done
done
```

> **Important:** Deep nesting reduces readability and can affect performance.

---

# Things to Remember

- **`for`** → Iterate over a list or sequence.
- **`while`** → Runs while the condition is **true**.
- **`until`** → Runs while the condition is **false**.
- **`select`** → Creates an interactive menu.
- **`break`** → Exits the loop immediately.
- **`continue`** → Skips the current iteration.
- **Always quote variables** (`"$var"`).
- **Always ensure loop termination** unless an infinite loop is intentional.
- **Keep loop bodies small** for better readability and maintenance.

---
```
```
---

# Bash Wildcards (Globbing Patterns)

Wildcards are expanded by the shell into matching filenames before the command executes.

| Pattern | Meaning | Example | Matches |
|---------|---------|---------|---------|
| `*` | Matches zero or more characters | `*.txt` | `a.txt`, `notes.txt` |
| `?` | Matches exactly one character | `file?.txt` | `file1.txt`, `fileA.txt` |
| `[abc]` | Matches one character from the set | `file[123].txt` | `file1.txt`, `file2.txt` |
| `[a-z]` | Matches one lowercase letter | `file[a-z].txt` | `filea.txt`, `filez.txt` |
| `[A-Z]` | Matches one uppercase letter | `file[A-Z].txt` | `fileA.txt` |
| `[0-9]` | Matches one digit | `file[0-9].txt` | `file7.txt` |
| `[!abc]` | Matches one character except those listed | `file[!123].txt` | `file4.txt`, `fileA.txt` |
| `*/` | Matches only directories | `for dir in */` | `src/`, `docs/` |
| `.*` | Matches hidden files | `ls .*` | `.bashrc`, `.gitignore` |

---

# Examples

## 1. All files and directories

```bash
for item in *; do
    echo "$item"
done
```

---

## 2. Only Text Files

```bash
for file in *.txt; do
    echo "$file"
done
```

---

## 3. Only Shell Scripts

```bash
for file in *.sh; do
    echo "$file"
done
```

---

## 4. Only Directories

```bash
for dir in */; do
    echo "$dir"
done
```

Matches:

---

## 5. Files Starting with "data"

```bash
for file in data*; do
    echo "$file"
done
```

---

## 6. Files Ending with ".log"

```bash
for file in *.log; do
    echo "$file"
done
```

---

## 7. Exactly One Character

```bash
for file in file?.txt; do
    echo "$file"
done
```
---

## 8. Character Range

```bash
for file in file[1-3].txt; do
    echo "$file"
done
```

Matches:


---

## 9. Multiple Extensions

```bash
for file in *.{txt,log}; do
    echo "$file"
done
```

---

# Summary

| Pattern | Description |
|---------|-------------|
| `*` | Everything |
| `*.txt` | All `.txt` files |
| `*.sh` | All shell scripts |
| `data*` | Starts with `data` |
| `*data` | Ends with `data` |
| `*data*` | Contains `data` |
| `?` | One character |
| `[abc]` | One of the listed characters |
| `[a-z]` | Character range |
| `[!abc]` | Any character except those listed |
| `*/` | Directories only |
| `.*` | Hidden files |