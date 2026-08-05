# Listing Files and Directories

# Command-Line Arguments

Command-line arguments are values passed to a script when it is executed.

Bash provides special positional parameters to access them.

| Parameter | Description |
| ---------- | ----------- |
| `$0` | Script name |
| `$1` | First argument |
| `$2` | Second argument |
| `$#` | Number of arguments |
| `$@` | All arguments as separate quoted strings |
| `$*` | All arguments as a single string |

---

# Globbing (Wildcard Expansion)

Globbing is Bash's filename matching mechanism.

Common wildcard patterns:

| Pattern | Description |
| -------- | ----------- |
| `*` | Matches zero or more characters |
| `?` | Matches exactly one character |
| `[abc]` | Matches any listed character |
| `[a-z]` | Matches a character range |

Globbing occurs **before** command execution.

> **Important**
>
> Globbing is **not** regular expressions.

---

# `shopt`

`shopt` is a Bash builtin that enables or disables optional shell behaviors.

## Syntax

Enable an option

```bash
shopt -s option
```

Disable an option

```bash
shopt -u option
```

---

## `nullglob`

If a wildcard pattern matches nothing, it expands to an empty list instead of remaining unchanged.

This prevents loops from processing unmatched wildcard patterns as literal strings.

> ⭐ **Highly Recommended**
>
> Enable this whenever iterating over wildcard expansions.

---

## `dotglob`

Includes hidden files (starting with `.`) during wildcard expansion.

By default, hidden files are ignored.

---

## `globstar`

Enables recursive wildcard matching using `**`.

Useful for recursive directory traversal.

---

## `extglob`

Enables extended wildcard patterns.

Useful for advanced filename matching.

---

# Quoting Variables

Quoting prevents Bash from performing:

- Word splitting
- Filename expansion (globbing)

Without quoting, filenames containing spaces or special characters may break scripts.

> ⭐ **One of the Most Important Bash Rules**
>
> Always quote variable expansions unless you intentionally want word splitting.

---

# Word Splitting

Word splitting occurs after parameter expansion.

Bash splits text using the characters stored in `IFS` (Internal Field Separator).

This is the primary reason filenames with spaces break scripts.

Proper quoting disables word splitting.

# Parameter Expansion

Parameter expansion is Bash's built-in mechanism for manipulating variable values.

It is generally faster than calling external utilities for simple string operations.

Common uses include:

- Removing prefixes
- Removing suffixes
- Replacing text
- Default values
- Checking variable existence

---

# Command Substitution

Command substitution captures the output of another command.

Preferred syntax:

```bash
$(command)
```

Older syntax:

```bash
`command`
```

The modern syntax is easier to read and supports nesting.

---

# `basename`

`basename` extracts only the filename from a path.

It is an external utility.

In Bash scripts, parameter expansion can often replace `basename`, avoiding the overhead of creating a new process.

---

# Exit Status

Every command returns an exit status.

| Exit Code | Meaning |
| ---------- | ------- |
| `0` | Success |
| Non-zero | Failure |
