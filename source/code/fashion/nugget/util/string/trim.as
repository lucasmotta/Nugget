package fashion.nugget.util.string
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function trim(value : String) : String
	{
		return trimLeft(trimRight(value));
	}
}
