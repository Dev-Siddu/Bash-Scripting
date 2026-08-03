# Variable Declaration and Usage in Bash

Variables are used to store values such as text, numbers, command output, and file paths. Bash variables are **dynamically typed**, meaning you don't need to declare their data type.

---

# 1. Variable Declaration

### Syntax

```bash
variable_name=value
```

### Example

```bash
name="John"
age=25
city=London
```

> **Important:** No spaces are allowed around the `=` operator.

✅ Correct

```bash
name="John"
count=10
```

❌ Wrong

```bash
name = "John"
count = 10
```

This will produce an error because Bash interprets them as commands.

---

# 2. Accessing Variable Value

Use `$` before the variable name.

```bash
name="Alice"

echo $name
```

Output

```text
Alice
```

You can also use braces.

```bash
echo ${name}
```

Braces are useful when combining variables with other text.

```bash
file="report"

echo "${file}.txt"
```

Output

```text
report.txt
```

---

# 3. String Variables

```bash
message="Hello World"

echo "$message"
```

Quotes preserve spaces.

---

# 4. Numeric Variables

Bash stores numbers as strings internally.

```bash
num1=10
num2=20
```

For arithmetic:

```bash
sum=$((num1 + num2))

echo $sum
```

Output

```text
30
```

---

# 5. Command Substitution

Store command output in a variable.

```bash
today=$(date)

echo "$today"
```

Older syntax (still works):

```bash
today=`date`
```

> Prefer `$(...)` because it is easier to read and supports nesting.

---

# 6. Read User Input

```bash
read -p "Enter your name: " name

echo "Hello $name"
```

---

# 7. Read-Only Variable

Prevent modification.

```bash
readonly company="Linux"

company="Ubuntu"
```

Output

```text
bash: company: readonly variable
```

---

# 8. Unset Variable

Remove a variable.

```bash
name="John"

unset name

echo "$name"
```

Output

```text

```

---

# 9. Environment Variables

Export a variable so child processes can access it.

```bash
export APP_ENV=production
```

Check:

```bash
echo $APP_ENV
```

---

# 10. Local Variable (Inside Function)

```bash
show() {
    local name="Linux"
    echo "$name"
}

show
```

`local` limits the variable to the function.

---

# Important Rules

### 1. No spaces around `=`

```bash
name="John"      # ✅
name = "John"    # ❌
```

---

### 2. Variable names can contain

- Letters
- Numbers
- Underscore (`_`)

Example

```bash
user_name="Tom"
count1=10
```

Cannot start with a number.

```bash
1name="Tom"   # ❌
```

---

### 3. Variable names are case-sensitive

```bash
name="Alice"
Name="Bob"

echo $name
echo $Name
```

Output

```text
Alice
Bob
```

---

### 4. Quote variables whenever possible

Good

```bash
echo "$name"
```

Avoid

```bash
echo $name
```

Quoting prevents issues with spaces and special characters.

---

### 5. Use meaningful variable names

Good

```bash
employee_name="John"
backup_path="/backup"
```

Avoid

```bash
a="John"
x="/backup"
```

---

### 6. Use `${variable}` when combining text

Good

```bash
file="backup"

echo "${file}.tar.gz"
```

Instead of

```bash
echo "$file.tar.gz"
```

---

### 7. Use `$(command)` instead of backticks

Good

```bash
current_dir=$(pwd)
```

Avoid

```bash
current_dir=`pwd`
```

---

### 8. Use `readonly` for constants

```bash
readonly PI=3.14
```

---

# Common Interview Questions

### Q1. How do you declare a variable in Bash?

```bash
name="Linux"
```

---

### Q2. Why should there be no spaces around `=`?

Because Bash treats spaces as command separators, causing syntax errors.

---

### Q3. What is the difference between `$var` and `${var}`?

- `$var` → Simple variable expansion.
- `${var}` → Safer when appending text or using parameter expansion.

Example:

```bash
name="file"

echo "${name}.txt"
```

---

### Q4. How do you store command output?

```bash
current_date=$(date)
```

---

### Q5. How do you make a variable available to child processes?

```bash
export PATH_NAME="/opt/scripts"
```

---

# Best Practices

- ✅ Never use spaces around `=`.
- ✅ Always quote variables: `"$variable"`.
- ✅ Use meaningful variable names.
- ✅ Prefer `${variable}` when concatenating strings.
- ✅ Use `$(command)` instead of backticks.
- ✅ Use `readonly` for constants.
- ✅ Use `local` for variables inside functions.


--- 
```

```
---
# Arrays in Bash

Arrays allow you to store multiple values in a single variable. Bash supports **indexed arrays** (most commonly used) and **associative arrays** (key-value pairs, Bash 4+).

---

# 1. Declaring an Indexed Array

### Syntax

```bash
array_name=(value1 value2 value3)
```

### Example

```bash
fruits=("Apple" "Banana" "Mango")
```

---

# 2. Accessing Array Elements

Array indexing starts from **0**.

```bash
fruits=("Apple" "Banana" "Mango")

echo "${fruits[0]}"
echo "${fruits[1]}"
echo "${fruits[2]}"
```

Output

```text
Apple
Banana
Mango
```

---

# 3. Print All Array Elements

```bash
echo "${fruits[@]}"
```

Output

```text
Apple Banana Mango
```

You can also use:

```bash
echo "${fruits[*]}"
```

> **Interview Note:**
>
> - `"${array[@]}"` treats each element separately (preferred).
> - `"${array[*]}"` treats all elements as a single string when quoted.

For most scripting, use:

```bash
"${array[@]}"
```

---

# 4. Get Array Length

### Number of elements

```bash
echo "${#fruits[@]}"
```

Output

```text
3
```

### Length of a specific element

```bash
echo "${#fruits[0]}"
```

Output

```text
5
```

---

# 5. Add Elements to an Array

Append an element.

```bash
fruits+=("Orange")
```

Now:

```bash
echo "${fruits[@]}"
```

Output

```text
Apple Banana Mango Orange
```

---

# 6. Modify an Array Element

```bash
fruits[1]="Grapes"
```

Output

```text
Apple Grapes Mango
```

---

# 7. Remove an Array Element

```bash
unset fruits[1]
```

Remaining elements:

```bash
echo "${fruits[@]}"
```

Output

```text
Apple Mango
```

> **Note:** `unset` removes the element but does **not** reindex the array automatically.

---

# 8. Remove Entire Array

```bash
unset fruits
```

---

# 9. Iterate Through an Array

### Using `for`

```bash
fruits=("Apple" "Banana" "Mango")

for fruit in "${fruits[@]}"
do
    echo "$fruit"
done
```

Output

```text
Apple
Banana
Mango
```

---

# 10. Iterate Using Index

```bash
for ((i=0; i<${#fruits[@]}; i++))
do
    echo "${fruits[$i]}"
done
```

---

# 11. Declare an Empty Array

```bash
numbers=()
```

Add values later.

```bash
numbers+=(10)
numbers+=(20)
numbers+=(30)
```

---

# 12. Declare an Associative Array (Bash 4+)

```bash
declare -A employee
```

Assign values.

```bash
employee[name]="John"
employee[role]="DevOps"
employee[city]="Hyderabad"
```

Access values.

```bash
echo "${employee[name]}"
echo "${employee[role]}"
```

Output

```text
John
DevOps
```

---

# 13. Print Keys and Values

### Keys

```bash
echo "${!employee[@]}"
```

### Values

```bash
echo "${employee[@]}"
```

---

# 14. Read Values into an Array

```bash
read -a numbers
```

Input

```text
10 20 30 40
```

Access

```bash
echo "${numbers[@]}"
```

---

# Important Rules

### 1. Array index starts from **0**

```bash
colors=("Red" "Green" "Blue")
```

| Index | Value |
|-------:|-------|
| 0 | Red |
| 1 | Green |
| 2 | Blue |

---

### 2. Always use quotes while expanding arrays

Good

```bash
for item in "${fruits[@]}"
```

Avoid

```bash
for item in ${fruits[@]}
```

Without quotes, elements containing spaces may split incorrectly.

---

### 3. Use `${#array[@]}` for array size

```bash
echo "${#fruits[@]}"
```

---

### 4. Use `+=` to append elements

```bash
fruits+=("Orange")
```

---

### 5. `unset` does not reindex arrays

```bash
unset fruits[1]
```

Indexes may become:

```text
0 2 3
```

To reindex:

```bash
fruits=("${fruits[@]}")
```

---

### 6. Associative arrays require `declare -A`

```bash
declare -A config
```

---

# Common Interview Questions

### Q1. Does Bash support arrays?

Yes.

- Indexed arrays
- Associative arrays (Bash 4+)

---

### Q2. What is the first index of a Bash array?

```text
0
```

---

### Q3. How do you print all array elements?

```bash
echo "${array[@]}"
```

---

### Q4. How do you find the size of an array?

```bash
echo "${#array[@]}"
```

---

### Q5. How do you append an element?

```bash
array+=("new_value")
```

---

### Q6. How do you delete an element?

```bash
unset array[index]
```

---

### Q7. What is the difference between indexed and associative arrays?

| Indexed Array | Associative Array |
|---------------|-------------------|
| Uses numeric indexes | Uses string keys |
| Starts from index 0 | Uses key-value pairs |
| Most commonly used | Useful for configuration data |

---

# Best Practices

- ✅ Always quote array expansions: `"${array[@]}"`.
- ✅ Use meaningful array names.
- ✅ Use `${#array[@]}` to get the number of elements.
- ✅ Use `+=` to append new elements.
- ✅ Prefer `for item in "${array[@]}"` for iteration.
- ✅ Use associative arrays for key-value mappings.
- ✅ Remember that `unset` does not automatically reindex arrays.



---
```

```
---

# Special Variables in Bash

Bash provides **special variables** that store information about the script, its arguments, process ID, exit status, and more. These are commonly used in automation scripts and are frequently asked in interviews.

---

# 1. `$0` - Script Name

Returns the name (or path) of the currently executing script.

### Example

```bash
#!/bin/bash

echo "$0"
```

Run:

```bash
./demo.sh
```

Output

```text
./demo.sh
```

---

# 2. `$1`, `$2`, `$3` ... - Positional Parameters

These represent the command-line arguments passed to the script.

### Example

```bash
#!/bin/bash

echo "First Argument : $1"
echo "Second Argument: $2"
```

Run:

```bash
./demo.sh Linux Bash
```

Output

```text
First Argument : Linux
Second Argument: Bash
```

---

# 3. `$#` - Number of Arguments

Returns the total number of arguments passed to the script.

### Example

```bash
echo "Total Arguments: $#"
```

Run

```bash
./demo.sh one two three
```

Output

```text
Total Arguments: 3
```

---

# 4. `$@` - All Arguments (Recommended)

Returns all command-line arguments as **separate quoted strings**.

### Example

```bash
for arg in "$@"
do
    echo "$arg"
done
```

Run

```bash
./demo.sh Linux DevOps AWS
```

Output

```text
Linux
DevOps
AWS
```

---

# 5. `$*` - All Arguments

Returns all arguments.

```bash
echo "$*"
```

Output

```text
Linux DevOps AWS
```

> **Interview Note:**
>
> - `"$@"` preserves each argument separately.
> - `"$*"` combines all arguments into a single string.
>
> For almost all scripts, prefer **`"$@"`**.

---

# 6. `$$` - Current Process ID (PID)

Returns the Process ID of the current script.

### Example

```bash
echo "PID: $$"
```

Output

```text
PID: 24861
```

---

# 7. `$!` - Background Process ID

Returns the PID of the last background process.

### Example

```bash
sleep 30 &

echo "Background PID: $!"
```

Output

```text
Background PID: 25010
```

---

# 8. `$?` - Exit Status

Returns the exit status of the previously executed command.

### Example

```bash
ls

echo $?
```

Output

```text
0
```

If a command fails:

```bash
ls xyz
echo $?
```

Output

```text
2
```

> **Important**
>
> - `0` → Success
> - Non-zero → Failure

This is one of the most commonly used special variables in shell scripting.

---

# 9. `$_` - Last Argument of Previous Command

Stores the last argument of the previously executed command.

### Example

```bash
mkdir demo

echo $_
```

Output

```text
demo
```

---

# 10. `$-` - Current Shell Options

Displays the current shell options enabled.

```bash
echo "$-"
```

Possible output

```text
himBH
```

Useful for debugging and shell behavior.

---

# Example Script

```bash
#!/bin/bash

echo "Script Name      : $0"
echo "First Argument   : $1"
echo "Second Argument  : $2"
echo "Total Arguments  : $#"
echo "All Arguments    : $@"
echo "Process ID       : $$"
echo "Last Exit Status : $?"
```

Run

```bash
./demo.sh Linux Bash
```

Output

```text
Script Name      : ./demo.sh
First Argument   : Linux
Second Argument  : Bash
Total Arguments  : 2
All Arguments    : Linux Bash
Process ID       : 24861
Last Exit Status : 0
```

---

# Important Rules (Interview + Daily Use)

### 1. `$0` is the script name

```bash
echo "$0"
```

---

### 2. `$1`, `$2`, `$3` are command-line arguments

```bash
./demo.sh one two
```

```bash
echo "$1"
```

Output

```text
one
```

---

### 3. `$#` gives the argument count

```bash
echo "$#"
```

---

### 4. Prefer `"$@"` over `"$*"`

Good

```bash
for arg in "$@"
do
    echo "$arg"
done
```

---

### 5. Always check command success using `$?`

```bash
cp file1 file2

if [ $? -eq 0 ]; then
    echo "Copy Successful"
fi
```

A cleaner and more common approach is:

```bash
if cp file1 file2; then
    echo "Copy Successful"
fi
```

---

### 6. Use `$$` when logging or creating unique temporary files

Example

```bash
logfile="app_$$.log"
```

---

### 7. Use `$!` to monitor background jobs

```bash
sleep 60 &
pid=$!

echo "$pid"
```

---

# Common Interview Questions

### Q1. What does `$0` represent?

The name (or path) of the currently executing script.

---

### Q2. What is the difference between `$@` and `$*`?

| `"$@"` | `"$*"` |
|---------|---------|
| Preserves each argument separately | Combines all arguments into one string |
| Recommended | Rarely used |

---

### Q3. Which variable stores the exit status of the last command?

```bash
$?
```

---

### Q4. Which variable stores the current process ID?

```bash
$$
```

---

### Q5. Which variable stores the PID of the last background process?

```bash
$!
```

---

### Q6. Which variable returns the number of command-line arguments?

```bash
$#
```

---

# Quick Reference Table

| Variable | Description |
|-----------|-------------|
| `$0` | Script name |
| `$1`, `$2`, ... | Positional arguments |
| `$#` | Number of arguments |
| `$@` | All arguments (recommended) |
| `$*` | All arguments as a single string |
| `$$` | Current process ID (PID) |
| `$!` | Last background process PID |
| `$?` | Exit status of previous command |
| `$_` | Last argument of previous command |
| `$-` | Current shell options |

---

# Best Practices

- ✅ Use `"$@"` instead of `"$*"`.
- ✅ Always check command success using `$?` or directly in an `if` statement.
- ✅ Use `$$` to create unique log or temporary file names.
- ✅ Quote positional parameters (`"$1"`, `"$2"`, `"$@"`) to safely handle spaces.
- ✅ Use meaningful argument validation with `$#` before processing inputs.