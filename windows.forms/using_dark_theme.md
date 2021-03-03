# Test if windows is using light/dark theme

This is not yet battle tested

	//using Microsoft.Win32
	public bool WindowsIsUsingDarkTheme()
	{
		var keyName = @"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize";
		var valueName = "AppsUseLightTheme";
		var value = Registry.GetValue(keyName, valueName, null);
		if (value == null)
		{
			return false;
		}

		if (int.TryParse(value.ToString(), out int result)){
			return result == 0;
		}

		return false;
	}

Source: https://gist.github.com/secretGeek/fa0ea0039f0c5eaa7d122fe569fa2b44

## See also

- [How to implement dark mode with css](../css/dark_mode_css.md)
- [Dark Theme in Notepad++](../notepad++/dark_theme_notepad++.md)
- [SSMS Dark Mode in SQL Server Management Studio](../sql_server/SSMS_Dark_Mode.md)