package fashion.nugget.util.number
{
	/**
	 * Limit a number
	 * 
	 * @param value					Your number
	 * @param min					The minimum
	 * @param max					The maximum
	 */
	public function limit(value : Number, min : Number, max : Number) : Number
	{
		return Math.max(min, Math.min(max, value));
	}
}
