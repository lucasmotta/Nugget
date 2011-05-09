package fashion.nugget.util.string
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function trimLeft(value : String) : String
	{
		var size : Number = value.length;
		for (var i : Number = 0; i < size; i++)
		{
			if (value.charCodeAt(i) > 32)
			{
				return value.substring(i);
			}
		}
		return "";
	}
}
