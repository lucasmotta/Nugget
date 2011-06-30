package fashion.nugget.core
{

	import flash.text.TextField;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface IGlossaryText extends IDisposable
	{

		function set htmlText(value : String) : void
		
		function get textField() : TextField
	}
}
