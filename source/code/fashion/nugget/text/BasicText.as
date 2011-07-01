package fashion.nugget.text
{


	import fashion.nugget.core.ITextEffect;
	import fashion.nugget.util.display.safeRemoveChild;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.AntiAliasType;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * @author		Lucas Motta (http://lucasmotta.com)
	 * @since		Jan 21, 2011
	 */
	public class BasicText extends Sprite
	{
		
		public static const LEFT : String = "left";
		
		public static const RIGHT : String = "right";
		
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

		protected var _width : Number;
		
		
		protected var _icon : DisplayObject;
		
		protected var _effect : ITextEffect;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function BasicText(content : String, format : TextFormat = null, css : StyleSheet = null) : void
		{
			_content = content;
			_format = format || new TextFormat("Arial", 12, 0x000000);
			_css = css;
			_width = 200;

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
			if (_format != null) _textField.defaultTextFormat = _format;
			if (_css != null) _textField.styleSheet = _css;
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.htmlText = _content;
			_textField.height = _textField.textHeight;
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
		
		public function setIcon(icon : DisplayObject, padding : int = 0, align : String = null) : void
		{
			removeIcon();
			
			_icon = icon;
			_icon.x = align == BasicText.RIGHT ? _textField.x + _textField.width + padding : 0;
			if(align != BasicText.RIGHT) _textField.x = _icon.x + _icon.width + padding;
			addChild(_icon);
		}
		
		public function removeIcon() : void
		{
			if(_icon)
			{
				safeRemoveChild(_icon);
				_icon = null;
				_textField.x = _textField.y = 0;
			}
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get content() : String
		{
			return _content;
		}
		
		/**
		 * HTML Text content
		 */
		public function set htmlText(value : String) : void
		{
			_content = value;
			if(_effect)
			{
				_effect.text = value;
			}
			else
			{
				_textField.htmlText = value;
			}
		}

		public function get htmlText() : String
		{
			return _textField.htmlText;
		}

		/**
		 * Text content
		 */
		public function set text(value : String) : void
		{
			_content = value;
			if(_effect)
			{
				_effect.text = value;
			}
			else
			{
				_textField.text = value;
			}
		}

		public function get text() : String
		{
			return _textField.text;
		}
		
		/**
		 * Set if the text is multiline or not
		 */
		public function set multiline(value : Boolean) : void
		{
			if (value)
			{
				_textField.wordWrap = true;
				_textField.multiline = true;
				_textField.width = _width;
				_textField.autoSize = _format.align == TextFormatAlign.RIGHT ? TextFieldAutoSize.RIGHT : TextFieldAutoSize.LEFT;
				_textField.htmlText = _content;
			}
			else
			{
				_textField.wordWrap = false;
				_textField.multiline = false;
				_textField.autoSize = TextFieldAutoSize.LEFT;
				_textField.htmlText = _content;
				_textField.height = _textField.textHeight;
			}
		}
		
		public function get multiline() : Boolean
		{
			return _textField.multiline;
		}

		/**
		 * TextFormat
		 */
		public function set textFormat(value : TextFormat) : void
		{
			_format = value;
			_textField.defaultTextFormat = _format;
		}

		public function get textFormat() : TextFormat
		{
			return _format;
		}

		/**
		 * Stylesheet
		 */
		public function set css(value : StyleSheet) : void
		{
			_css = value;
			_textField.styleSheet = _css;
		}

		public function get css() : StyleSheet
		{
			return _css;
		}
		
		/**
		 * Text Effect
		 */
		public function set effect(value : ITextEffect) : void
		{
			_effect = value;
			if(_effect)
			{
				_effect.source = this;
			}
		}
		
		public function get effect() : ITextEffect
		{
			return _effect;
		}
		
		/**
		 * Set if the text is a pixel font or not
		 */
		public function set pixelFont(value : Boolean) : void
		{
			_textField.antiAliasType = value ? AntiAliasType.NORMAL : AntiAliasType.ADVANCED;
		}
		
		/**
		 * TextField width
		 */
		override public function set width(value : Number) : void
		{
			_width = value;
			if(this.multiline) _textField.width = value;
		}
			
		override public function get width() : Number
		{
			return _textField.width;
		}

		/**
		 * Length
		 */
		public function get length() : int
		{
			return _textField.text.length;
		}

		/**
		 * Get the textField instance
		 */
		public function get textField() : TextField
		{
			return _textField;
		}
	}
}
