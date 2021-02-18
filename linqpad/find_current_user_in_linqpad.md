# Find current user in linqpad


	public static string CurrentUser()
	{
		return System.IO.Path.Combine(Environment.UserDomainName, Environment.UserName);
	}
