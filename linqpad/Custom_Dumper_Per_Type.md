# Customize Dump Style and Colors in Linqpad using MyExtensions


Make true bools green, false bools red, and some other things blue.

	static object ToDump(object input)
	{
		if (input is bool && (bool)input) return Util.WithStyle(input, "color:green");
		if (input is bool && !(bool)input) return Util.WithStyle(input, "color:red");
		return Util.WithStyle(input, "color:blue");
	}


? WHy doesn't this make string render blue? string doesn't pass through here it seems.


	void Main()
	{
		"string".Dump(); //string, white <-- WHY!?
		true.Dump();  //True, green
		false.Dump(); //False, red
		false.Dump(true); //False, red
		false.Dump(false); //False, red
		false.Dump("Text"); //False, red, text dark orange (in dark theme)
	}

	// Define other methods and classes here
