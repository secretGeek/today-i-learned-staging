dir . *.md -Recurse | 
    Select-String -Pattern "//TODO:" | 
    ft -property FileName, Line -autosize