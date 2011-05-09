package fashion.nugget.loader
{

	import fashion.nugget.util.toBoolean;

	/**
	 * Return an object with parameters from a XML
	 * TODO	Implement more parameters
	 * 
	 * @param xml			XML
	 */
	public function getLoaderParameters(xml : XML) : Object
	{
		var obj : Object = {};

		if ("@estimatedBytes" in xml) obj["estimatedBytes"] = parseFloat(xml.attribute("estimatedBytes"));
		if ("@noCache" in xml) obj["noCache"] = toBoolean((xml.attribute("noCache")));
		if ("@id" in xml) obj["name"] = xml.attribute("id").toString();

		return obj;
	}
}
