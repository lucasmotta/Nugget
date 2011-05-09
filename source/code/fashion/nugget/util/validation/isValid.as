package fashion.nugget.util.validation
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function isValid(value : *) : Boolean
	{
		if(value is Number)
		{
			return !isNaN(value) && isFinite(value);
		}
		if(value == null) return false;
		if(value == undefined) return false;
		if(String(value) == "undefined") return false;
		return true;
	}
}
