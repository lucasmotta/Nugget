package fashion.nugget.text
{

	import fashion.nugget.util.validation.isURL;
	import fashion.nugget.util.string.trim;
	import fashion.nugget.util.validation.isEmail;
	import fashion.nugget.util.validation.isEmpty;

	import flash.events.FocusEvent;
	import flash.text.StyleSheet;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class InputText extends BasicText
	{
		
		public static const STRING : String = "string";
		
		public static const EMAIL : String = "email";
		
		public static const URL : String = "url";
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _contentType : String;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 * 
		 * @param content		You text content
		 * @param format		Default TextFormat of your text
		 * @param css			Default StyleSheet of your text
		 */
		public function InputText(content : String, format : TextFormat = null, css : StyleSheet = null)
		{
			_contentType = InputText.STRING;
			
			super(content, format, css);
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function setupText() : void
		{
			super.setupText();
			
			_textField.autoSize = TextFieldAutoSize.NONE;
			_textField.width = _width;
			_textField.selectable = true;
			_textField.type = TextFieldType.INPUT;
			_textField.addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
			_textField.addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onFocusIn(e : FocusEvent) : void
		{
			if(trim(this.text) == _content)
			{
				_textField.text = "";
			}
		}
		
		protected function onFocusOut(e : FocusEvent) : void
		{
			if(trim(this.text).length == 0)
			{
				_textField.text = _content;
			}
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Check if your text is valid or not (check if it's not empty, if it's an email, etc...)
		 */
		public function validate() : Boolean
		{
			var textValue : String = trim(this.text);
			if(isEmpty(textValue) || textValue == _content)
			{
				return false;
			}
			else if(_contentType == InputText.EMAIL)
			{
				return isEmail(textValue);
			}
			else if(_contentType == InputText.URL)
			{
				return isURL(textValue);
			}
			return true;
		}
		
		override public function dispose() : void
		{
			if(_textField)
			{
				_textField.removeEventListener(FocusEvent.FOCUS_IN, onFocusIn);
				_textField.removeEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
			}
			
			super.dispose();
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		override public function set width(value : Number) : void
		{
			super.width = value;
			_textField.width = _width;
		}
		
		/**
		 * Content type of your InputText. You can set it as a regular string content, an email or url.
		 * 
		 */
		public function set contentType(value : String) : void
		{
			_contentType = value;
		}
		
		public function get contentType() : String
		{
			return _contentType;
		}
	}
}
