package fashion.nugget.i18n
{

	import fashion.nugget.core.IGlossaryText;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class GlossaryItem
	{

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _glossaryText : IGlossaryText;
		
		protected var _key : String;

		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function GlossaryItem(glossaryText : IGlossaryText, key : String)
		{
			_glossaryText = glossaryText;
			_key = key;
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get glossaryText() : IGlossaryText
		{
			return _glossaryText;
		}
		
		public function set key(value : String) : void
		{
			_key = value;
		}
		
		public function get key() : String
		{
			return _key;
		}
	}
}
