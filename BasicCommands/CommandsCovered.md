# Basic Linux Commands

## `echo`

Prints the specified text or variables to the terminal.

**Example:**

```bash
echo "Hello, World!"
```

---

## `cat`

Displays the contents of one or more files in the terminal.

**Example:**

```bash
cat file.txt
```

---

## `ls`

Lists files and directories in the current directory (or a specified directory).

**Example:**

```bash
ls
```

---

# Command Substitution

Command substitution executes a command and replaces it with its output.

**Syntax:**

```bash
variable=$(command)
```

**Example:**

```bash
current_date=$(date)
echo "$current_date"
```

In this example, the `date` command is executed first, and its output is assigned to the `current_date` variable.
