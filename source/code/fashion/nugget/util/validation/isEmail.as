package fashion.nugget.util.validation
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function isEmail(value : String) : Boolean
	{
		return value.match(/^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i) != null;
	}
}
