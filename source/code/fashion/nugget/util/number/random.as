package fashion.nugget.util.number
{
	/**	
	 *	Return a random number between two specified numbers
	 *	
	 *	@param min					Minimun number
	 *	@param max					Max number
	 */
	public function random(min : int, max : int) : int
	{
		return Math.floor(Math.random() * (max - min + 1)) + min;
	}
}
