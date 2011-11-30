package fashion.nugget.loader
{


	/**
	 * Return an object with parameters from a XML
	 * TODO	Implement more parameters
	 * 
	 * @param xml			XML
	 */
	public function getLoaderParameters(xml : XML) : Object
	{
		var obj : Object = {};
		
		checkParam(xml, obj, "estimatedBytes");
		checkParam(xml, obj, "noCache");
		checkParam(xml, obj, "id", "name");
		checkParam(xml, obj, "name");
		checkParam(xml, obj, "type");
		checkParam(xml, obj, "glossary");
		
		return obj;
	}
}
