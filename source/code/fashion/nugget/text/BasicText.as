package fashion.nugget.text
{


	import fashion.nugget.core.IDisposable;
	import fashion.nugget.core.ITextEffect;
	import fashion.nugget.util.display.safeRemoveChild;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.PixelSnapping;
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
	public class BasicText extends Sprite implements IDisposable
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _content : String;

		protected var _textFormat : TextFormat;

		protected var _css : StyleSheet;

		protected var _textField : TextField;
		
		protected var _bitmap : Bitmap;
		
		protected var _isBitmap : Boolean;

		protected var _width : Number;
		
		protected var _pixelFont : Boolean;
		
		
		protected var _effect : ITextEffect;


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
		public function BasicText(content : String, format : TextFormat = null, css : StyleSheet = null) : void
		{
			_content = content;
			_textFormat = format;
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
			if (_textFormat != null) _textField.defaultTextFormat = _textFormat;
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
		/**
		 * Set the thickness and sharpness of your text
		 * 
		 * @param thickness		Thickness of your text
		 * @param sharpness		Sharpness of your text
		 */
		public function setThickness(thickness : int, sharpness : int) : void
		{
			_textField.thickness = thickness;
			_textField.sharpness = sharpness;
		}
		
		/**
		 * Clone this text instance
		 */
		public function clone() : BasicText
		{
			var txt : BasicText = new BasicText(_content, _textFormat, _css);
			txt.pixelFont = this.pixelFont;
			txt.multiline = this.multiline;
			txt.width = this.width;
			return txt;
		}
		
		/**
		 * Create a bitmap with the text drawn on it.
		 * Userfull for when you have to animate your text
		 */
		public function toBitmap() : void
		{
			if(_bitmap)
			{
				safeRemoveChild(_bitmap);
				_bitmap = null;
			}
			_isBitmap = true;
			_textField.visible = false;
			
			_bitmap = new Bitmap(new BitmapData(_textField.width, _textField.height, true, BitmapDataChannel.ALPHA), PixelSnapping.NEVER, true);
			_bitmap.bitmapData.draw(_textField);
			_bitmap.scaleY = 1.001;
			addChild(_bitmap);
		}
		
		/**
		 * Dispose
		 */
		public function dispose() : void
		{
			if(_effect)
			{
				_effect.dispose();
				_effect = null;
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
				_effect.htmlText = value;
			}
			else
			{
				_textField.htmlText = value;
			}
			if(_isBitmap) toBitmap();
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
			if(_isBitmap) toBitmap();
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
				_textField.autoSize = _textFormat.align == TextFormatAlign.RIGHT ? TextFieldAutoSize.RIGHT : TextFieldAutoSize.LEFT;
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
			if(_isBitmap) toBitmap();
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
			_textFormat = value;
			_textField.defaultTextFormat = _textFormat;
			_textField.htmlText = _textField.htmlText;
			if(_isBitmap) toBitmap();
		}

		public function get textFormat() : TextFormat
		{
			return _textFormat;
		}

		/**
		 * Stylesheet
		 */
		public function set css(value : StyleSheet) : void
		{
			_css = value;
			_textField.styleSheet = _css;
			_textField.htmlText = _textField.htmlText;
			if(_isBitmap) toBitmap();
		}

		public function get css() : StyleSheet
		{
			return _css;
		}
		
		/**
		 * Custom effect of your text.
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
		 * Set if the text is a pixel font or not (actually it will only change the AntiAliasType)
		 */
		public function set pixelFont(value : Boolean) : void
		{
			_pixelFont = value;
			_textField.antiAliasType = value ? AntiAliasType.NORMAL : AntiAliasType.ADVANCED;
			
			if(_isBitmap) toBitmap();
		}
		
		public function get pixelFont() : Boolean
		{
			return _pixelFont;
		}
		
		/**
		 * TextField Width.
		 */
		override public function set width(value : Number) : void
		{
			_width = value;
			if(this.multiline) _textField.width = value;
			if(_isBitmap) toBitmap();
		}
			
		override public function get width() : Number
		{
			return _textField.width;
		}
		
		override public function set height(value : Number) : void
		{
			_textField.height = value;
			if(_isBitmap) toBitmap();
		}
		
		override public function get height() : Number
		{
			return _textField.height;
		}

		/**
		 * Length of characters on your textfield
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
