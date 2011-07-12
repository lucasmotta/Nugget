package fashion.nugget.text.effects
{

	import fashion.nugget.core.ITextEffect;
	import fashion.nugget.text.BasicText;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class AbstractEffect implements ITextEffect
	{
		
		protected var _source : BasicText;
		
		public function dispose() : void
		{
			
		}
		
		public function set text(value : String) : void
		{
		}

		public function set htmlText(value : String) : void
		{
		}

		public function set source(value : BasicText) : void
		{
			_source = value;
		}
	}
}
