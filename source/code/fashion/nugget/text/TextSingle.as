package fashion.nugget.text
{

	import flash.text.StyleSheet;
	import flash.display.Sprite;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	/**
	 * @author		Lucas Motta (http://lucasmotta.com)
	 * @since		Jan 21, 2011
	 */
	public class TextSingle extends Sprite
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		
		protected var _content : String;
		
		protected var _format : TextFormat;
		
		protected var _css : StyleSheet;
		
		protected var _textField : TextField;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function TextSingle(content : String, format : TextFormat = null, css : StyleSheet = null) : void
		{
			_content = content;
			_format = format;
			_css = css;
			
			setupText();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function setupText() : void
		{
			_textField = new TextField();
			_textField.multiline = false;
			_textField.embedFonts = true;
			_textField.selectable = false;
			_textField.wordWrap = false;
			_textField.mouseWheelEnabled = false;
			_textField.alwaysShowSelection = false;
			if(_format) _textField.defaultTextFormat = _format;
			if(_css) _textField.styleSheet = _css;
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.htmlText = _content;
			_textField.height = _textField.textHeight;
			_textField.mouseEnabled = false;
			addChild(_textField);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------		
		public function setThickness(thickness : int, sharpness : int) : void
		{
			_textField.thickness = thickness;
			_textField.sharpness = sharpness;
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function set htmlText(value : String) : void
		{
			_textField.htmlText = value;
		}
		
		public function set text(value : String) : void
		{
			_textField.text = value;
		}
		
		public function set textFormat(value : TextFormat) : void
		{
			_format = value;
			_textField.defaultTextFormat = _format;
		}
		
		public function set css(value : StyleSheet) : void
		{
			_css = value;
			_textField.styleSheet = _css;
		}
		
		public function get text() : String
		{
			return _textField.text;
		}
		
		public function get htmlText() : String
		{
			return _textField.htmlText;
		}
		
		public function get textFormat() : TextFormat
		{
			return _format;
		}
		
		public function get css() : StyleSheet
		{
			return _css;
		}
		
		public function get length() : int
		{
			return _textField.text.length;
		}
		
		public function get textField() : TextField
		{
			return _textField;
		}
	}
}
