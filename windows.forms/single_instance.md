# Single Instance Application

Note that this TIL includes a bigger snippet than I'd usually snaffle. I put it here so i have it available locally, and so i can use "copy to clipboard" to grab it in no time.

> You can use a Mutex to signal to Windows that a certain resource is already active. But this doesn't bring the running instance to the user's attention.
>
> ... Almost every professional software program focuses the application.
>
> &mdash;[Sam Allen, DotNetPerls: Single Instance Windows Forms](https://www.dotnetperls.com/single-instance-windows-form)

So what I always do is just use Sam Allen's code.

The class is like this:

	using System.Diagnostics;
	using System.Runtime.InteropServices;
	using System.Text;
	using System;
	using System.Windows.Forms;

	/// <summary>
	/// Check running processes for an already-running instance.
	/// Implements a simple, effective algorithm.
	//  Find currently running processes with matching titles.
	/// </summary>
	static class ProcessChecker
	{
			/// <summary>
			/// Stores a required string that must be present in the window title for it
			/// to be detected.
			/// </summary>
			static string _requiredString;

			/// <summary>
			/// Contains signatures for C++ DLLs using interop.
			/// </summary>
			internal static class NativeMethods
			{
					[DllImport("user32.dll")]
					public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);

					[DllImport("user32.dll")]
					public static extern bool SetForegroundWindow(IntPtr hWnd);

					[DllImport("user32.dll")]
					public static extern bool EnumWindows(EnumWindowsProcDel lpEnumFunc,
							Int32 lParam);

					[DllImport("user32.dll")]
					public static extern int GetWindowThreadProcessId(IntPtr hWnd,
							ref Int32 lpdwProcessId);

					[DllImport("user32.dll")]
					public static extern int GetWindowText(IntPtr hWnd, StringBuilder lpString,
							Int32 nMaxCount);

					public const int SW_SHOWNORMAL = 1;
			}

			public delegate bool EnumWindowsProcDel(IntPtr hWnd, Int32 lParam);

			/// <summary>
			/// Perform finding and showing of running window.
			/// </summary>
			/// <returns>Bool, which is important and must be kept to match up
			/// with system call.</returns>
			static private bool EnumWindowsProc(IntPtr hWnd, Int32 lParam)
			{
					int processId = 0;
					NativeMethods.GetWindowThreadProcessId(hWnd, ref processId);

					StringBuilder caption = new StringBuilder(1024);
					NativeMethods.GetWindowText(hWnd, caption, 1024);

					// Use IndexOf to make sure our required string is in the title.
					if (processId == lParam && (caption.ToString().IndexOf(_requiredString,
							StringComparison.OrdinalIgnoreCase) != -1))
					{
							// Restore the window.
							NativeMethods.ShowWindowAsync(hWnd, NativeMethods.SW_SHOWNORMAL);
							NativeMethods.SetForegroundWindow(hWnd);
					}
					return true; // Keep this.
			}

			/// <summary>
			/// Find out if we need to continue to load the current process. If we
			/// don't focus the old process that is equivalent to this one.
			/// </summary>
			/// <param name="forceTitle">This string must be contained in the window
			/// to restore. Use a string that contains the most
			/// unique sequence possible. If the program has windows with the string
			/// "Journal", pass that word.</param>
			/// <returns>False if no previous process was activated. True if we did
			/// focus a previous process and should simply exit the current one.</returns>
			static public bool IsOnlyProcess(string forceTitle)
			{
					_requiredString = forceTitle;
					foreach (Process proc in Process.GetProcessesByName(Application.ProductName))
					{
							if (proc.Id != Process.GetCurrentProcess().Id)
							{
									NativeMethods.EnumWindows(new EnumWindowsProcDel(EnumWindowsProc),
											proc.Id);
									return false;
							}
					}
					return true;
			}
	}

And in `static void main` Add this as the first line....

	if (!ProcessChecker.IsOnlyProcess("Focus")) return;

Where "Focus" is an example value passed to the optional parameter "forceTitle".

Described with this comment:

> forceTitle
>
> This string must be contained in the window to restore. Use a string that contains the most unique sequence possible. If the program has windows with the string "Journal", pass that word.
>
> &mdash;[Sam Allen, DotNetPerls: Single Instance Windows Forms](https://www.dotnetperls.com/single-instance-windows-form)

## Source

- [Sam Allen, DotNetPerls: Single Instance Windows Forms](https://www.dotnetperls.com/single-instance-windows-form)