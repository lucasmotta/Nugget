package fashion.nugget.util.string
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function toTitleCase(value : String) : String
	{
		value = value.replace(/<br.*?>/gi, " ");
		var array : Array = value.split(" ");
		var str : String;
		
		for(var i : int; i < array.length; i++)
		{
			str = array[i];
			array[i] = str.slice(0, 1).toUpperCase() + str.slice(1, str.length).toLowerCase();
		}
		return array.join(" ");
	}
}
