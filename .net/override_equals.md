# Override equals to compare objects in C#

If A and B are two different objects in memory, but they are of the same type and have all the same values... are they equal?

It's a deep question, but if, for your problem domain, the answer is "YES" then you can embed this answer in your code as follows:

	public class MyThing
	{
		public string ID { get; set; }
		public decimal? Hats { get; set; }
		public decimal? Noses { get; set; }

		public override bool Equals(object obj)
		{
			var test = obj as Mything;
			return
				test != null &&
				ID == test.ID &&
				Hats == test.Hats &&
				Noses == test.Noses;
		}
	}