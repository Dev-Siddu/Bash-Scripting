# Bash Brackets and Special Symbols Guide

Bash uses different types of brackets and grouping symbols for different purposes:

| Symbol | Purpose |
|--------|---------|
| `[ ]` | Test conditions |
| `[[ ]]` | Advanced Bash conditional expressions |
| `( )` | Subshell execution |
| `(( ))` | Arithmetic evaluation |
| `{ }` | Command grouping and variable expansion |

---

# 1. `[ ... ]` (Test Command)

`[ ]` is used for checking conditions. It is actually the Bash `test` command.

## Syntax

```bash
if [ condition ]; then
    commands
fi
```

## Examples

String comparison:

```bash
if [ "$name" = "John" ]; then
    echo "Name matched"
fi
```

Numeric comparison:

```bash
if [ "$age" -ge 18 ]; then
    echo "Adult"
fi
```

File check:

```bash
if [ -f "file.txt" ]; then
    echo "File exists"
fi
```

## Space Rules

Spaces are mandatory.

Correct:

```bash
[ "$a" = "$b" ]
```

Wrong:

```bash
["$a"="$b"]
```

---

# 2. `[[ ... ]]` (Bash Conditional Expression)

`[[ ]]` is an advanced version of `[ ]`.

It is recommended for Bash scripts.

## Syntax

```bash
if [[ condition ]]; then
    commands
fi
```

## Features

- Supports regex matching
- Supports pattern matching
- Safer with variables
- Does not perform word splitting

## Examples

String comparison:

```bash
if [[ "$name" == "John" ]]; then
    echo "Matched"
fi
```

Pattern matching:

```bash
if [[ "$file" == *.txt ]]; then
    echo "Text file"
fi
```

Regex matching:

```bash
if [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Valid number"
fi
```

## Space Rules

Correct:

```bash
[[ "$name" == "John" ]]
```

Wrong:

```bash
[["$name"=="John"]]
```

---

# 3. `( )` (Subshell)

Parentheses create a separate shell environment called a **subshell**.

Commands inside `( )` execute separately from the current shell.

## Syntax

```bash
(
    commands
)
```

## Example

```bash
(
    cd /tmp
    ls
)

pwd
```

The directory change inside `( )` does not affect the parent shell.

## Variable Scope Example

```bash
(
    value="hello"
)

echo "$value"
```

`value` is not available outside the subshell.

---

# 4. `(( ))` (Arithmetic Evaluation)

`(( ))` is used for integer arithmetic operations.

## Syntax

```bash
(( expression ))
```

## Examples

Arithmetic:

```bash
(( sum = 10 + 20 ))
```

Increment:

```bash
(( count++ ))
```

Conditional arithmetic:

```bash
if (( number % 2 == 0 )); then
    echo "Even"
fi
```

## Rules

Inside `(( ))`:

- `$` is optional for variables.
- Quotes are not required.

Correct:

```bash
(( number + 5 ))
```

Also works:

```bash
(( $number + 5 ))
```

Preferred:

```bash
(( number + 5 ))
```

---

# 5. `{ }` (Command Grouping)

Curly braces group commands and execute them in the **current shell**.

Unlike `( )`, they do not create a subshell.

## Syntax

```bash
{
    command1
    command2
}
```

Important:

- A space is required after `{`
- A semicolon or newline is required before `}`

## Example

```bash
{
    echo "Hello"
    echo "World"
}
```

Output:

```text
Hello
World
```

---

## Difference Between `( )` and `{ }`

| `( )` | `{ }` |
|---|---|
| Runs in subshell | Runs in current shell |
| Variable changes are lost | Variable changes remain |
| No semicolon required before closing | Requires `;` or newline before closing |

Example:

### Using `( )`

```bash
(
    name="John"
)

echo "$name"
```

Output:

```text
(empty)
```

---

### Using `{ }`

```bash
{
    name="John"
}

echo "$name"
```

Output:

```text
John
```

---

# 6. `${ }` (Variable Expansion)

`${ }` is used to clearly identify variables.

## Syntax

```bash
${variable}
```

## Example

Without braces:

```bash
name="John"

echo "$name123"
```

Bash looks for a variable called `name123`.

---

With braces:

```bash
echo "${name}123"
```

Output:

```text
John123
```

---

# Common Uses of `${ }`

## Default Value

Use a default value if a variable is empty:

```bash
echo "${name:-Guest}"
```

If `name` is empty, it prints:

```text
Guest
```

---

## Remove Prefix/Suffix

Remove shortest matching prefix:

```bash
${variable#pattern}
```

Remove shortest matching suffix:

```bash
${variable%pattern}
```

---

## String Length

```bash
${#variable}
```

Example:

```bash
name="Linux"

echo ${#name}
```

Output:

```text
5
```

---

# 7. `$(( ))` (Arithmetic Expansion)

`$(( ))` is used when you want the result of arithmetic as a value.

## Syntax

```bash
$(( expression ))
```

Example:

```bash
result=$((10 + 20))

echo "$result"
```

Output:

```text
30
```

Difference:

```bash
(( ))
```

Used for:

- Calculations
- Conditions
- Increment/decrement

Example:

```bash
((count++))
```

---

```bash
$(( ))
```

Used for:

- Storing/displaying calculation results

Example:

```bash
total=$((price * quantity))
```

---

# 8. Command Substitution `$( )`

Command substitution runs a command and stores its output.

## Syntax

```bash
$(command)
```

## Example

```bash
date=$(date)

echo "$date"
```

Another example:

```bash
files=$(ls)

echo "$files"
```

---

# Difference Between Similar Looking Syntax

| Syntax | Meaning |
|--------|---------|
| `[ ]` | Test condition |
| `[[ ]]` | Advanced Bash condition |
| `( )` | Run commands in subshell |
| `{ }` | Group commands in current shell |
| `(( ))` | Arithmetic evaluation |
| `${ }` | Variable expansion |
| `$(( ))` | Arithmetic expansion |
| `$( )` | Command substitution |

---

# Quick Memory Guide

```
[ ]       → Check condition
[[ ]]     → Bash condition + regex
( )       → New shell environment
{ }       → Group commands here
(( ))     → Do arithmetic
${ }      → Work with variables
$(( ))    → Get arithmetic result
$( )      → Get command output
```

---

# Important Spacing Rules

| Syntax | Space Required? |
|--------|----------------|
| `[ ]` | Yes |
| `[[ ]]` | Yes |
| `( )` | No strict rule |
| `{ }` | Yes after `{` and before `}` |
| `(( ))` | Optional |
| `${ }` | No space inside |
| `$(( ))` | Optional |
| `$( )` | Optional |

Example:

```bash
${name}
$(date)
$((10+20))
```

No spaces inside these expansions.