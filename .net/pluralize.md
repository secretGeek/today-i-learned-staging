# Pluralization Helper

...as an extension to integer...


Usage: $"See you in {days.Pluralize("day")}"


	public static string Pluralize(this int value, string singular)
	{
		return Pluralize(value, singular, singular + "s");
	}

	public static string Pluralize(this int value, string singular, string plural)
	{
		return string.Format("{0:N0} {1}", value, value == 1 || value == -1 ? singular : plural);
	}