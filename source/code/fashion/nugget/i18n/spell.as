package fashion.nugget.i18n
{
	/**
	 * Returns the specific content of a given key
	 * 
	 * @param key			Key.
	 						Use # followed by a number to get the a specific node by it's indice. Example: <code>get("node.item#2)</code> will return the third "item" node (because it's starts on 0).;
	 						Use @ followed by any value to get the attribute. Example: <code>get("node.item#2.@color)</code> will return the attribute "color" of the third "item" node;
	 * @param replace		Extra parameter if you want to replace anything on your key. It' very usefull when you have to set an number/indice on your string.
	*/
	public function spell(key : String, replace : Object = null) : *
	{
		return Glossary.getInstance().spell(key, replace);
	}
}
