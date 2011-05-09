package fashion.nugget.util.number
{
	/**
	 * Round a number to a specific size
	 * 
	 * @param value					The number that you want to round
	 */
	public function round(value : Number, size : int = 10) : int
	{
		return Math.round(value / size) * size;
	}
}
