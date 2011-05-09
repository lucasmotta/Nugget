package fashion.nugget.util.string
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function trimRight(value : String) : String
	{
		var size : Number = value.length;
		for (var i : Number = size; i > 0; i--)
		{
			if (value.charCodeAt(i - 1) > 32)
			{
				return value.substring(0, i);
			}
		}
		return "";
	}
}
