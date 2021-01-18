# Get The Windows User's Display Name in Asp.Net Mvc


Simplest version I can find...


	// using System.DirectoryServices.AccountManagement;

	public string GetDisplayName(string name)
	{
		using (PrincipalContext context = new PrincipalContext(ContextType.Domain))
		{
			using (UserPrincipal user = UserPrincipal.FindByIdentity(context, name))
			{
				return user?.DisplayName;
			}
		}
	}



	GetDisplayName(System.Web.HttpContext.Current.User.Identity.Name);

or simply

	GetDisplayName(User.Identity.Name);


(This is in a situation where we're using `Windows Authentication` in an Intranet application)


## Source

- [Get Name of User from Active Directory](https://stackoverflow.com/questions/39215056/get-name-of-user-from-active-directory/39215311)