# Basic examples of using SumIf in Excel

For each cell in this range, if the following condition is true, then Add it to a running total.

It's actually a bit more advanced than that...

Add together all of the cells in the range A1 to A12 that match the condition: "over 5"

    =SUMIF(A1:A12,">5")

Add together all of the cells in the range B1 to B12 whose counterpart in the range A1 to A12 matches the condition "starts wtih 'apple'"

    =SUMIF(A1:A12, "apple*",B1:B12)

What are all the things this "condition" can be ?

| Condition | Meaning |
|===========|=========|
| `3` | Equals '3'  (note there are no double quotes) |
| `">10"` | Greater than 10 (note the double quotes)|
| `B5` | Equals the value in cell `B5` (note there are no surrounding double quotes) |
| `"apple"` | Equals the text 'apple'  (note the double quotes) |
| `"apple*"` | Starts with the txt 'apple'  (note the double quotes) |
| `"~?"` | Starts with the txt 'apple'  (note the double quotes) |
| `TODAY()` | Equals the result of running the function `TODAY()` (note there are no surrounding double quotes) |


>  Important: Any text criteria or any criteria that includes logical or mathematical symbols must be enclosed in double quotation marks ("). If the criteria is numeric, double quotation marks are not required.
>
> &mdash; [SUMIF Function - microsoft.com](https://support.microsoft.com/en-us/office/sumif-function-169b8c99-c05c-4483-a712-1697a653039b#:~:text=For%20example%2C%20the%20formula%20%3DSUMIF,multiple%20criteria%2C%20see%20SUMIFS%20function.)

## Source

- [SUMIF Function - microsoft.com](https://support.microsoft.com/en-us/office/sumif-function-169b8c99-c05c-4483-a712-1697a653039b#:~:text=For%20example%2C%20the%20formula%20%3DSUMIF,multiple%20criteria%2C%20see%20SUMIFS%20function.)