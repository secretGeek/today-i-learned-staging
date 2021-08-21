# Log Helper for Linqpad

	public static Action<string> Log = (message) => $"{sw.Elapsed:hh\\h\\ mm\\m\\ ss\\s}: {message}".Dump();
