package fashion.nugget.text
{

	import flash.text.StyleSheet;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class TextMulti extends TextSingle
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private var _width : int;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function TextMulti(content : String, width : int, format : TextFormat = null, css : StyleSheet = null)
		{
			_width = width;
			//
			super(content, format, css);
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function setupText() : void
		{
			super.setupText();
			//
			this.textField.wordWrap = true;
			this.textField.multiline = true;
			this.textField.width = _width;
			this.textField.autoSize = _format.align == TextFormatAlign.RIGHT ? TextFieldAutoSize.RIGHT : TextFieldAutoSize.LEFT;
			this.textField.htmlText = _content;
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		override public function set width(value : Number) : void
		{
			_width = value;
			this.textField.width = value;
		}
			
		override public function get width() : Number
		{
			return _width;
		}

	}
}
