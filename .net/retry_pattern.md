# Retry Pattern in C#

I'm not sure I want to share this, or encourage this... but it's a piece of code I wrote for doing a "retry" of an unreliable action.

	public bool Retry(Action a, int maxRetries = 3)
	{
		int retries = 0;
		int sleepDelay = 500;
		bool succeeded = false;
		while (!succeeded && retries < maxRetries)
		{
			try
			{
				a();
				succeeded = true;
			}
			catch (Exception ex)
			{
				retries++;
				System.Threading.Thread.Sleep(sleepDelay);

				if (retries == maxRetries)
				{
					throw new Exception("Ran out of retries", ex);
				}

				sleepDelay = sleepDelay * 2; // exponential back-off.
			}
		}

		return succeeded;
	}
