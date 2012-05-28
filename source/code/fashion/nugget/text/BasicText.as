package fashion.nugget.text
{


	import fashion.nugget.util.string.toTitleCase;
	import fashion.nugget.util.toBoolean;
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
	/**
	 * @author		Lucas Motta (http://lucasmotta.com)
	 * @since		Jan 21, 2011
	 */
	public class BasicText extends Sprite implements IDisposable
	{
		
		public static const TEXT_TRANSFORM_UPPERCASE : String = "uppercase";
		public static const TEXT_TRANSFORM_LOWERCASE : String = "lowercase";
		public static const TEXT_TRANSFORM_CAPITALIZE : String = "capitalize";
		public static const TEXT_TRANSFORM_NONE : String = "none";
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _content : String;

		protected var _styleClass : String;
		
		protected var _css : StyleSheet;

		protected var _textField : TextField;
		
		protected var _bitmap : Bitmap;
		
		protected var _isBitmap : Boolean;

		protected var _width : Number;
		
		protected var _pixelFont : Boolean;
		
		protected var _textTransform : String;
		
		
		protected var _effect : ITextEffect;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 * 
		 * @param content		You text content
		 * @param styleClass	CSS Class of your textfield
		 * @param css			Custom StyleSheet for your textField. If you don't set any custom css, the default will be used.
		 */
		public function BasicText(content : String, styleClass : String = null, customCSS : StyleSheet = null) : void
		{
			_content = content;
			_styleClass = styleClass || "";
			_css = customCSS || CSS.defaultCSS;
			_width = 200;
			_textTransform = BasicText.TEXT_TRANSFORM_NONE;

			setupText();
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function setupText() : void
		{
			var style : Object = _css.getStyle("." + _styleClass);
			if(style.hasOwnProperty("textTransform")) _textTransform = style["textTransform"];
			
			_textField = new TextField();
			_textField.multiline = false;
			_textField.embedFonts = true;
			_textField.selectable = false;
			_textField.wordWrap = false;
			_textField.mouseWheelEnabled = false;
			_textField.alwaysShowSelection = false;
			if (_css != null) _textField.styleSheet = _css;
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_textField.autoSize = TextFieldAutoSize.LEFT;
			_textField.htmlText = setContent(_content);
			_textField.height = _textField.textHeight;
			addChild(_textField);
			
			if(style.hasOwnProperty("antiAliasThickness")) _textField.thickness = style["antiAliasThickness"];
			if(style.hasOwnProperty("antiAliasSharpness")) _textField.sharpness = style["antiAliasSharpness"];
			if(style.hasOwnProperty("antiAliasType")) _textField.antiAliasType = style["antiAliasType"];
			if(style.hasOwnProperty("multiline")) this.multiline = toBoolean(style["multiline"]);
			if(style.hasOwnProperty("bitmap")) if(toBoolean(style["bitmap"])) toBitmap();
			if(style.hasOwnProperty("x")) _textField.x = style["x"];
			if(style.hasOwnProperty("y")) _textField.y = style["y"];
			if(style.hasOwnProperty("width")) this.width = style["width"];
			if(style.hasOwnProperty("height")) this.height = style["height"];
		}
		
		protected function setContent(value : String, applyCSS : Boolean = true) : String
		{
			switch(_textTransform)
			{
				case TEXT_TRANSFORM_UPPERCASE :
					value = value.toUpperCase();
				break;
				case TEXT_TRANSFORM_LOWERCASE :
					value = value.toLowerCase();
				break;
				case TEXT_TRANSFORM_CAPITALIZE :
					value = toTitleCase(value);
				break;
			}
			return _styleClass && applyCSS ? "<span class=\"" + _styleClass + "\">" + value + "</span>" : value;
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
			var txt : BasicText = new BasicText(_content, _styleClass, _css);
			txt.pixelFont = this.pixelFont;
			txt.multiline = this.multiline;
			txt.width = this.width;
			txt.textTransform = this.textTransform;
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
				_bitmap = safeRemoveChild(_bitmap);
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
				_effect.htmlText = setContent(_content);
			}
			else
			{
				_textField.htmlText = setContent(_content);
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
				_effect.text = setContent(_content);
			}
			else
			{
				_textField.text = setContent(_content);
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
				_textField.autoSize = TextFieldAutoSize.LEFT;
				_textField.htmlText = setContent(_content);
			}
			else
			{
				_textField.wordWrap = false;
				_textField.multiline = false;
				_textField.autoSize = TextFieldAutoSize.LEFT;
				_textField.htmlText = setContent(_content);
				_textField.height = _textField.textHeight;
			}
			if(_isBitmap) toBitmap();
		}
		
		public function get multiline() : Boolean
		{
			return _textField.multiline;
		}

		/**
		 * Stylesheet
		 */
		public function set css(value : StyleSheet) : void
		{
			_css = value;
			_textField.styleSheet = _css;
			_textField.htmlText = setContent(_content);
			if(_isBitmap) toBitmap();
		}

		public function get css() : StyleSheet
		{
			return _css;
		}
		
		/**
		 * CSS Class
		 */
		public function set styleClass(value : String) : void
		{
			_styleClass = value || "";
			_textField.styleSheet = _css;
			_textField.htmlText = setContent(_content);
			if(_isBitmap) toBitmap();
		}

		public function get styleClass() : String
		{
			return _styleClass;
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
			_textField.width = value;
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
		
		/**
		 * Text Transform (uppercase, lowercase, capitalize, none).
		 */
		public function get textTransform() : String
		{
			return _textTransform;
		}

		public function set textTransform(textTransform : String) : void
		{
			_textTransform = textTransform;
		}
	}
}
