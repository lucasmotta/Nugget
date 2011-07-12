package fashion.nugget.core
{

	import fashion.nugget.text.BasicText;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ITextEffect extends IDisposable
	{

		function set text(value : String) : void
		
		function set htmlText(value : String) : void

		function set source(value : BasicText) : void
	}
}
