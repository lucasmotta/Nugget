package fashion.nugget.util
{
	import fashion.nugget.util.string.trim;
	import fashion.nugget.util.validation.isEmpty;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function toBoolean(value : *, defaultValue : Boolean = false) : Boolean
	{
		var str : String = trim(String(value)).toLowerCase();
		if(isEmpty(str)) return defaultValue;
		if(str == "1" || str == "true")
		{
			return true;
		}
		return false;
	}
}
