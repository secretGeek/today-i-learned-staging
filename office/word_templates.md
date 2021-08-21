# How to edit an MS Word Template

Your personal custom MS Word Templates are saved here:

	%userprofile%\OneDrive\Documents\Custom Office Templates

(Paste that address into Windows Explorer, and you will be taken to the correct folder.)

That path will be different for everyone (becayse of the user name) but may look like this:

	C:\Users\MY_USER_NAME\OneDrive\Documents\Custom Office Templates

You can access it in powershell like this:

	"$($env:userprofile)\OneDrive\Documents\Custom Office Templates"

That folder may contain some of your previously created `.dotx` templates for Word.

If you click on one of those to "edit" it -- it will instead try to create a new document based on that template.

So make the changes you want, and when you are ready to save choose "save as..." and set the type to template. Then write over the template you are updating.

## How to Create a Word Template

> create a template by saving a document as a .dotx file

But does that make it available for use?

When you use "New" to create a new document, you will see your pinned templates and some "Office" templates from the world. Click on the "Personal" tab, next to office to see your own templates.

If you want one to be shown at the top of the screen, *pin* it, by hovering over it and then clicking the "pin" button.

## External sources

- [Edit templates](https://support.microsoft.com/en-us/office/edit-templates-b2cb7adb-aec2-429f-81fd-3d5bd33cf264)

## See also

- [Save word document as a template](../winword/save_word_as_template.md)
