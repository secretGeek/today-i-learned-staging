# Histogram

You can use the group-object to do standard grouping.

This shows all of the files in the current folder, grouped into buckets according to their size.
Each bucket is 1000 bytes.

    dir |
        group-object -property { [int]($_.length / 1000) } | sort @{e={$_.Name -as [int]}} |
            format-table @{Expression={[string]([int]($_.Name) * 1000) + "-" + [string](-1+([int]($_.Name)+1) * 1000)};Label="Bucket";width=10},
                @{Expression={$                /*
                //if (OutputPath != null && !String.IsNullOrWhiteSpace(IncludeFileTypes))
                {
                    var fileTypes = IncludeFileTypes.Split(";".ToCharArray());
                    foreach (var fileType in fileTypes)
                    {
                        foreach (var f in Directory.EnumerateFiles(InputPath, fileType, Recurse ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly))
                        {
                            var inputFilePath = Path.GetDirectoryName(f);
                            var relativePath = Path.GetRelativePath(InputPath, inputFilePath);
                            var targetFileName = Path.Combine(OutputPath, relativePath, Path.GetFileName(f));
                            // don't copy anything FROM the output path.....
                            //TODO: depends if OS is case-insensitive
                            if (inputFilePath.ToLowerInvariant().StartsWith(OutputPath.ToLowerInvariant()))
                            {
                                continue;
                            }
                            if (!DryRun)
                            {
                                File.Copy(f, targetFileName, true);
                            } else
                            {
                                Console.WriteLine($"dryrun: copy {f} {targetFileName}");
                            }
                        }
                    }

                }*/
_.Count};Label="Count";width=10},
                @{Expression={$_.Group};Label="Members";width=50} -autosize

*Consider* running the initial `dir` recursively with `-rec`

Group by file type:

    dir -rec | group-object -property { ($_.extension) } | sort @{e={$_.Name -as [int]}}

Exclude directories (but include their files)

	dir -rec | ?{ $_.PSIsContainer -ne $true } | group-object -property { ($_.extension) } | sort

...for looking at size of all markdown files in TIL...

	dir . *.md -rec | ?{ $_.PSIsContainer -ne $true } |
         group-object -property { [int]($_.length / 300) } | sort @{e={$_.Name -as [int]}} |
             format-table @{Expression={[string]([int]($_.Name) * 300) + "-" + [string](-1+([int]($_.Name)+1) * 300)};Label="Bucket";width=10},
                 @{Expression={$_.Count};Label="Count";width=10},
                 @{Expression={$_.Group};Label="Members";width=50} -autosize