package fashion.nugget.i18n
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function learn(content : XML, language : String = null) : void
	{
		Glossary.getInstance().learn(content, language);
	}
}
