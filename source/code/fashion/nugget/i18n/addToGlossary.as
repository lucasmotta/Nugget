package fashion.nugget.i18n
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function addToGlossary(item : GlossaryItem) : GlossaryItem
	{
		return Glossary.instance.add(item);
	}
}
