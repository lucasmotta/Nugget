package fashion.nugget.util.string
{
	/**
	 * Format the percentage
	 * 
	 * @param value The percentage (0 - 1)
	 * @param multiplier Multiplier of the percentage
	 * @param totalChars Total of characters to display. If is lower then 100 will be completed with zeros.
	 * @param signal Signal to be added at the end of the value ("%")
	 * 
	 * @return Formatted percentage
	 */
	public function formatPercentage(value : Number, multiplier : int = 100, totalChars : int = 3, signal : String = "%") : String
	{
		var zeros : String = "";
		value = Math.round(value * multiplier);
		while (zeros.length < (totalChars - value.toString().length))
		{
			zeros += "0";
		}
		return zeros + value.toString() + signal;
	}
}
