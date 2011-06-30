package fashion.nugget.text
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class LineTextBackground
	{
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private var _color : uint;
		
		private var _padding : int;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function LineTextBackground(color : uint, padding : int) : void
		{
			_color = color;
			_padding = padding;
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		
		public function get color() : uint
		{
			return _color;
		}
		
		public function get padding() : int
		{
			return _padding;
		}
	}
}
