# Save word document as a template

- Create a document you wish was a usable template.
- File > "Save as"
	- Choose the type of `Word Template (*.dotx)`
- It will want to save in a weird folder
	- `C:\Users\YourUser\OneDrive\Documents\Custom Office Templates`
		- (`"$($env:userprofile)\OneDrive\Documents\Custom Office Templates"` in powershell)
	- But that will only mean they are usable on the **current** machine.
- Save it wherever you want. Exit word.

When you want to use that template:

- Double click the file:
	- It will create a new document, `Document1`, using that template as the basis for the document.

## See also

- [How to edit an MS Word Template](../office/word_templates.md)
