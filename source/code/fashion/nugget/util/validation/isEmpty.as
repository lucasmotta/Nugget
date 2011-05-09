package fashion.nugget.util.validation
{
	/**
	 *	Check if the string is empty or not (by removing the blank spaces)
	 *	
	 *	@param value The string to check
	 */
	public function isEmpty(value : String) : Boolean
	{
		var str : String = value.replace(/^\s+|\s+$/g, '');
		str = str.replace(/\s+/g, ' ');
		return !str.length;
	}
}
