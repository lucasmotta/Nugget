package fashion.nugget.i18n
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function removeFromGlossary(item : GlossaryItem) : void
	{
		Glossary.instance.remove(item);
	}
}
