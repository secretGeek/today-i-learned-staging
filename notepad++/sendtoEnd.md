# Send to End Macro

I often want to grab some text -- send it to the end (or the top!) of the file, without losing my place in the file.

It's more specific than that... I want to grab a "todo" item, make it as "brought forward" and paste it at the end of the document. (Without losing my place!)

To achieve this, I use the bookmark and the macro feature, and record a macro called "Send to End", with keystroke "Ctrl-Shift-D" -- and it does these steps:

0. Macro: Start Recording
1. copies the currently selected text.
2. replaces [ space ] with [ v ].
3. Set book mark (with 'Toggle BOOK MARK (Ctrl F2)')
4. moves to end of document.
5. Press Enter
6. paste.
7. returns to previus bookmark (with Shift F2)
8. Clear book mark (with 'Toggle BOOK MARK (Ctrl F2)')
9. Macro: Stop Recording.
10. Save current recorded macro.
11. Name it "SendToEnd" and apply shortcut Ctrl Shift D.)