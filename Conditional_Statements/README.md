# Conditional Statements in Bash Scripting

Conditional statements allow a Bash script to make decisions based on whether a condition is **true** or **false**.

---

## Syntax

```bash
if [ condition ]; then
    # Commands if condition is true
fi
```

### Example

```bash
age=20

if [ "$age" -ge 18 ]; then
    echo "Eligible to vote"
fi
```

---

## if...else

Use `else` when you want to execute an alternative block.

```bash
num=5

if [ "$num" -gt 10 ]; then
    echo "Greater than 10"
else
    echo "10 or less"
fi
```

---

## if...elif...else

Use `elif` to check multiple conditions.

```bash
marks=75

if [ "$marks" -ge 90 ]; then
    echo "Grade A"
elif [ "$marks" -ge 60 ]; then
    echo "Grade B"
else
    echo "Grade C"
fi
```

---

# Comparison Operators

## Numeric Comparisons

| Operator | Meaning |
|----------|---------|
| `-eq` | Equal |
| `-ne` | Not equal |
| `-gt` | Greater than |
| `-lt` | Less than |
| `-ge` | Greater than or equal |
| `-le` | Less than or equal |

Example:

```bash
if [ "$a" -gt "$b" ]; then
    echo "a is greater"
fi
```

---

## String Comparisons

| Operator | Meaning |
|----------|---------|
| `=` or `==` | Equal |
| `!=` | Not equal |
| `-z` | String is empty |
| `-n` | String is not empty |

```bash
-z → Zero characters → Empty
-n → Non-zero characters → Not Empty
```

Example:

```bash
name="John"

if [ "$name" = "John" ]; then
    echo "Welcome John"
fi
```

---

## File Test Operators

| Operator | Meaning |
|----------|---------|
| `-f` | File exists and is a regular file |
| `-d` | Directory exists |
| `-e` | File or directory exists |
| `-r` | Readable |
| `-w` | Writable |
| `-x` | Executable |

Example:

```bash
if [ -f "data.txt" ]; then
    echo "File exists"
fi
```

---

# Logical Operators

| Operator | Meaning |
|----------|---------|
| `&&` | AND |
| `\|\|` | OR |
| `!` | NOT |

Example:

```bash
age=25

if [ "$age" -ge 18 ] && [ "$age" -le 60 ]; then
    echo "Working age"
fi
```

---

# Nested if

```bash
age=25
citizen="yes"

if [ "$age" -ge 18 ]; then
    if [ "$citizen" = "yes" ]; then
        echo "Eligible"
    fi
fi
```

---

# Important Notes

- Always leave **spaces** around `[` and `]`.
- Quote variables: `"$var"` to avoid errors with empty values or spaces.
- Use `-eq`, `-gt`, etc. for **numbers**.
- Use `=` or `==` for **strings**.
- Prefer `[[ ... ]]` in modern Bash because it provides safer string handling and supports additional operators.

Example:

```bash
if [[ "$name" == "John" ]]; then
    echo "Hello John"
fi
```

---

# Summary

- `if` → Execute code when a condition is true.
- `else` → Execute an alternative block.
- `elif` → Check multiple conditions.
- Numeric operators → `-eq`, `-gt`, `-lt`, `-ge`, `-le`, `-ne`.
- String operators → `=`, `!=`, `-z`, `-n`.
- File operators → `-f`, `-d`, `-e`, `-r`, `-w`, `-x`.
- Logical operators → `&&`, `||`, `!`.


---


## `stty -echo`

The `stty -echo` command disables **terminal echo**, meaning the characters you type are **not displayed** on the screen.

### Syntax

```bash
stty -echo
```

### Breakdown

- `stty` → **Set Terminal** settings.
- `-echo` → Disable character echoing.

### Purpose

- Hides user input from the terminal.
- Commonly used when reading **passwords** or other sensitive information.

### Restore Echo

```bash
stty echo
```

This re-enables terminal echo so that typed characters are displayed again.

> **Note:** If you disable echo using `stty -echo`, always restore it with `stty echo`; otherwise, the terminal will continue hiding typed characters.

```

```

---

# `=~` (Regular Expression Match)

The `=~` operator is used inside `[[ ... ]]` to check whether a string **matches a regular expression (regex)**.

### Syntax

```bash
[[ string =~ regex ]]
```

### Purpose

- Matches a string against a regular expression.
- Returns **true** if the string matches the pattern.
- Works only with `[[ ... ]]`, **not** with `[ ... ]`.

### Notes

- `=~` is a **Bash-specific** operator.
- The right-hand side is treated as a **regular expression**, not a normal string.
- Do **not** quote the regular expression unless you intentionally want it treated as a literal string.

### Summary

- `=~` → Regular expression match.
- Used only with `[[ ... ]]`.
- Returns **true** if the string matches the regex pattern.


---
