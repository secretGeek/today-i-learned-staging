# To Convert to or from an internal name in sharepoint


Sharepoint internal names can only include letters/numbers and underscores.

Any other character needs to be encoded using this scheem:

Convert the character's ascii representation to a four digit hex number, prefixed with 'x' and surrounded by underscores.

| Character | Encoded As |
|-----------|------------|
| `(space)` | `_x0020_` |
| `!` | `_x0021_` |
| `"` | `_x0022_` |
| `#` | `_x0023_` |
| `$` | `_x0024_` |
| `%` | `_x0025_` |
| `&` | `_x0026_` |
| `'` | `_x0027_` |
| `(` | `_x0028_` |
| `)` | `_x0029_` |
| `*` | `_x002a_` |
| `+` | `_x002b_` |
| `,` | `_x002c_` |
| `-` | `_x002d_` |
| `.` | `_x002e_` |
| `/` | `_x002f_` |
| `:` | `_x003a_` |
| `;` | `_x003b_` |
| `<` | `_x003c_` |
| `=` | `_x003d_` |
| `>` | `_x003e_` |
| `?` | `_x003f_` |
| `@` | `_x0040_` |
| `\` | `_x005c_` |
| `^` | `_x005e_` |
| `(backtick)` | `_x0060_` |
| `{` | `_x007b_` |
| `|` | `_x007c_` |
| `}` | `_x007d_` |
| `~` | `_x007e_` |


I don't know how a *literal* "_x" is encoded, but no doubt there is a convention, such as encoding literal `_x` as  `_xx` (thus a `_x(x)+` decodes to `_($1)` )(But this is just speculation.)


## See also

- [This NimbleText Pattern for converting sharepoint names](https://nimbletext.com/Live/-864084882/)