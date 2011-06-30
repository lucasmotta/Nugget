package fashion.nugget.i18n
{
	/**
	 * Returns the specific content of a given key
	 * 
	 * @param key			Key
	 * @param replace		Extra parameter if you want to replace anything on your key. It' very usefull when you have to set an number/indice on your string.
	 */
	public function spell(key : String, ...replace) : *
	{
		return Glossary.getInstance().spell(key, replace);
	}
}
