package fashion.nugget.loader
{
	import fashion.nugget.util.validation.isEmpty;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function checkParam(xml : XML, obj : Object, attribute : String, result : String = null) : Boolean
	{
		if (("@" + attribute) in xml)
		{
			if(isEmpty(xml.attribute(attribute)))
			{
				return false;
			}
			if(Boolean(xml.attribute(attribute)))
			{
				obj[result || attribute] = xml.attribute(attribute);
				return true;
			}
		}
		return false;
	}
}
