# Terminal Formatting Using `tput`

`tput` retrieves terminal capabilities from the **terminfo** database, making it more portable than hardcoded ANSI escape sequences.

---

## Reset

```bash
reset=$(tput sgr0)
```

---

## Text Styles

```bash
bold=$(tput bold)
dim=$(tput dim)
italic=$(tput sitm)          # May not be supported on all terminals
underline=$(tput smul)
reverse=$(tput rev)
blink=$(tput blink)          # Rarely supported
standout=$(tput smso)
invisible=$(tput invis)
```

---

## Turn Off Styles

```bash
reset=$(tput sgr0)           # Reset all formatting
no_underline=$(tput rmul)
no_standout=$(tput rmso)
```

> **Note:** Most scripts simply use `reset` instead of disabling individual styles.

---

## Foreground (Text) Colors

```bash
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
```

| Color | Code |
|--------|------|
| Black | `setaf 0` |
| Red | `setaf 1` |
| Green | `setaf 2` |
| Yellow | `setaf 3` |
| Blue | `setaf 4` |
| Magenta | `setaf 5` |
| Cyan | `setaf 6` |
| White | `setaf 7` |

---

## Background Colors

```bash
bg_black=$(tput setab 0)
bg_red=$(tput setab 1)
bg_green=$(tput setab 2)
bg_yellow=$(tput setab 3)
bg_blue=$(tput setab 4)
bg_magenta=$(tput setab 5)
bg_cyan=$(tput setab 6)
bg_white=$(tput setab 7)
```

| Color | Code |
|--------|------|
| Black | `setab 0` |
| Red | `setab 1` |
| Green | `setab 2` |
| Yellow | `setab 3` |
| Blue | `setab 4` |
| Magenta | `setab 5` |
| Cyan | `setab 6` |
| White | `setab 7` |

---

## Cursor Controls

```bash
save_cursor=$(tput sc)
restore_cursor=$(tput rc)

cursor_up=$(tput cuu1)
cursor_down=$(tput cud1)
cursor_left=$(tput cub1)
cursor_right=$(tput cuf1)

clear_screen=$(tput clear)
clear_line=$(tput el)
```

---

## Common Variables (Recommended)

```bash
# Reset
reset=$(tput sgr0)

# Styles
bold=$(tput bold)
dim=$(tput dim)
italic=$(tput sitm)
underline=$(tput smul)
reverse=$(tput rev)

# Foreground Colors
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# Background Colors
bg_black=$(tput setab 0)
bg_red=$(tput setab 1)
bg_green=$(tput setab 2)
bg_yellow=$(tput setab 3)
bg_blue=$(tput setab 4)
bg_magenta=$(tput setab 5)
bg_cyan=$(tput setab 6)
bg_white=$(tput setab 7)
```

---

## Usage

```bash
printf "%sSuccess!%s\n" "${green}${bold}" "${reset}"

printf "%sError!%s\n" "${red}${bold}" "${reset}"

printf "%sWarning!%s\n" "${yellow}" "${reset}"

printf "%sInformation%s\n" "${cyan}" "${reset}"
```

---

## Note

- `tput` is **preferred** over hardcoded ANSI escape sequences for portable scripts.
- Always reset formatting using `$(tput sgr0)`.
- `italic`, `blink`, and `invisible` may not be supported by all terminal emulators.
- Bright colors (e.g., bright red, bright green) are **not standardized** with `tput`; they depend on terminal capabilities.
- `printf` is preferred over `echo -e` for consistent formatting.