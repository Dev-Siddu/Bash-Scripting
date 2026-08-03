# I/O Redirection in Linux

## What is I/O Redirection?

I/O (Input/Output) redirection is a feature in Linux shells that allows you to control where a command receives its input from and where it sends its output.

Every Linux process has three standard file descriptors:

| File Descriptor | Name | Description |
|----------------|------|-------------|
| `0` | Standard Input (stdin) | Receives input |
| `1` | Standard Output (stdout) | Displays normal output |
| `2` | Standard Error (stderr) | Displays error messages |

---

## Output Redirection (`>`)

Redirects the standard output of a command to a file.

**Syntax:**

```bash
command > file
```

**Example:**

```bash
echo "Hello Linux" > output.txt
```

If `output.txt` does not exist, it is created. If it already exists, its contents are overwritten.

---

## Append Output (`>>`)

Appends output to the end of an existing file instead of overwriting it.

**Syntax:**

```bash
command >> file
```

**Example:**

```bash
echo "New Line" >> output.txt
```

---

## Input Redirection (`<`)

Takes input from a file instead of the keyboard.

**Syntax:**

```bash
command < file
```

**Example:**

```bash
sort < names.txt
```

---

## Error Redirection (`2>`)

Redirects only error messages to a file.

**Syntax:**

```bash
command 2> error.txt
```

**Example:**

```bash
ls invalid_directory 2> error.log
```

---

## Redirect Standard Output and Standard Error

Store normal output and errors in separate files.

```bash
command > output.txt 2> error.txt
```

Store both in the same file.

```bash
command > all_output.txt 2>&1
```

---

## Discard Output

The special file `/dev/null` discards any data written to it.

Discard only standard output:

```bash
command > /dev/null
```

Discard only errors:

```bash
command 2> /dev/null
```

Discard both output and errors:

```bash
command > /dev/null 2>&1
```

---

## Here Document (Heredoc)

A heredoc allows you to provide multiple lines of input directly in a script.

**Syntax:**

```bash
command << DELIMITER
text
text
DELIMITER
```

**Example:**

```bash
cat > document.txt << EOF
This is line 1.
This is line 2.
This is line 3.
EOF
```

---

## Here String (`<<<`)

A here string passes a single string as input to a command.

```bash
grep Linux <<< "I love Linux"
```

---

## Common File Descriptor Shortcuts

| Redirection | Meaning |
|-------------|---------|
| `>` | Redirect stdout (same as `1>`) |
| `1>` | Redirect standard output |
| `2>` | Redirect standard error |
| `<` | Redirect standard input (same as `0<`) |
| `>>` | Append standard output |
| `2>>` | Append standard error |
| `2>&1` | Redirect stderr to stdout |

---

## Summary

- **stdin (0)** → Input source
- **stdout (1)** → Normal output
- **stderr (2)** → Error output
- **`>`** → Overwrite output to a file
- **`>>`** → Append output to a file
- **`<`** → Read input from a file
- **`2>`** → Redirect errors
- **`2>&1`** → Combine stdout and stderr
- **`/dev/null`** → Discard unwanted output
- **`<<`** → Here Document (multi-line input)
- **`<<<`** → Here String (single-line input)