package fashion.nugget.util.validation
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function isURL(value : String) : Boolean
	{
		return new RegExp(/((?:http|https):\/\/[a-z0-9\/\?=_#&%~-]+(\.[a-z0-9\/\?=_#&%~-]+)+)|(www(\.[a-z0-9\/\?=_#&%~-]+){2,})/gi).test(value);
	}
}
