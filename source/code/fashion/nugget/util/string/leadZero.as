package fashion.nugget.util.string
{
	/**	
	 *	Add zeros, if needed, to format a number
	 *	
	 *	@param number				The number to apply
	 *	@param total				Number of extra zeros to add
	 */
	public function leadZero(number : Number, total : int = 1) : String
	{
		return Math.pow(10, total - number.toString().length).toString().substr(1) + number;
	}
}
