# Renaming a database - Simply - In Depth - SQL Server

**Caveat:** Be sure to back everything up before doing this kind of change.

I've really written this for people who are changing local development instances of a database, or low-user-count test instances... look elsewhere for something more robust when renaming a production system.



I have a database called "OLD_DB_NAME" -- and I want to rename it (to "NEW_DB_NAME")

Right click and rename in SSMS is not too reliable -- it may not be able to get exclusive access. Use this instead:

	use master
	ALTER DATABASE OLD_DB_NAME SET SINGLE_USER WITH ROLLBACK IMMEDIATE    
	ALTER DATABASE OLD_DB_NAME MODIFY NAME = [NEW_DB_NAME]
	ALTER DATABASE NEW_DB_NAME SET MULTI_USER

But note that the logical files (inside sql server) and the physical files (on your hard drive) have not been renamed.

You can see these by using:

    sp_helpdb NEW_DB_NAME


If it used to exists as these "logical" files:

- `OLD_DB_NAME`
- `OLD_DB_NAME_log`

and these "physical" files

- `C:\Users\My_Local_User\OLD_DB_NAME.mdf`
- `C:\Users\My_Local_User\OLD_DB_NAME_log.mdf`

...then it still does! Our 'Alter database' above did not change any of those.

If we feel that "renaming" ought to also rename these files -- then we need to do a bit more work yet.

## Rename the logical files

	USE NEW_DB_NAME
	GO
	ALTER DATABASE NEW_DB_NAME MODIFY FILE (NAME=N'OLD_DB_NAME', NEWNAME=N'NEW_DB_NAME')
	GO
	ALTER DATABASE NEW_DB_NAME MODIFY FILE (NAME=N'OLD_DB_NAME_log', NEWNAME=N'NEW_DB_NAME_log')
	GO

Check that it worked by running:

    sp_helpdb NEW_DB_NAME

You should see that the physical files, the .ldf and .mdf files, still use the old name, but the logical names have been updated.


## Rename the physical files: requires a backup and restore!

To rename the physical files, you need to:

1. Backup your database 
2. Rename the now defunct database so that's DB Name is out of the way...
2. Restore the backup to your new physical files.


### Step 1: Back up the database:

    BACKUP DATABASE NEW_DB_NAME
      TO DISK = 'C:\Apps\scratch\NEW_DB_NAME.bak'

You might inspect the physical and logical files that it expects, by running this command:

	RESTORE FILELISTONLY
	FROM DISK = 'C:\Apps\scratch\NEW_DB_NAME.bak'



### Step 2: Rename the now defunct DB to get it out of the way...


	use master
	ALTER DATABASE NEW_DB_NAME SET SINGLE_USER WITH ROLLBACK IMMEDIATE    
	ALTER DATABASE NEW_DB_NAME MODIFY NAME = [zz_NEW_DB_NAME]
	ALTER DATABASE zz_NEW_DB_NAME SET MULTI_USER


...You might even rename its logical files....

	USE zz_NEW_DB_NAME
	GO
	ALTER DATABASE zz_NEW_DB_NAME MODIFY FILE (NAME=N'NEW_DB_NAME', NEWNAME=N'zz_NEW_DB_NAME')
	GO
	ALTER DATABASE zz_NEW_DB_NAME MODIFY FILE (NAME=N'NEW_DB_NAME_log', NEWNAME=N'zz_NEW_DB_NAME_log')
	GO

### Step 3: Restore the db to the new physical files


First inspect the files in the backup....


	RESTORE FILELISTONLY
	FROM DISK = 'C:\Apps\scratch\NEW_DB_NAME.bak'


	RESTORE DATABASE NEW_DB_NAME	
	  FROM DISK = 'C:\Apps\scratch\NEW_DB_NAME.bak'
	  WITH MOVE 'NEW_DB_NAME' TO 'C:\Users\MyUser\NEW_DB_NAME.mdf',
	  MOVE 'NEW_DB_NAME_log' TO 'C:\Users\MyUser\NEW_DB_NAME_log.ldf'

And check that your newly restored db has the right name and logical/physical file names, with:

    sp_helpdb NEW_DB_NAME
