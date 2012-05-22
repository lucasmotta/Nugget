package fashion.nugget.util.string
{
	import fashion.nugget.util.validation.isEmpty;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function toTitleCase(value : String) : String
	{
		if(isEmpty(value)) return value;
		value = value.split(" ").map(function(myElement : String, myIndex : int, myArr : Array) : String
		{
			return myElement.substr(0, 1).toLocaleUpperCase() + myElement.substr(1);
		}).join(" ");
		return value;
	}
}
