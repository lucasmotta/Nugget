package fashion.nugget.text
{

	import fashion.nugget.util.display.safeRemoveChild;

	import flash.display.Sprite;
	import flash.text.AntiAliasType;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * Create a multi-column text on a very simple way.
	 * You don't have to worry about creating textFields and linking them.
	 */
	public class ColumnText extends Sprite
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
		
		
		protected var _width : int;
		
		protected var _height : int;
		
		protected var _columns : int;
		
		protected var _margin : int;
		
		protected var _pixelFont : Boolean;
		
		
		protected var _texts : Vector.<BasicText>;
		
		protected var _columnWidth : Number;
		
		
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
		public function ColumnText(content : String, format : TextFormat = null, css : StyleSheet = null)
		{
			_content = content;
			_textFormat = format;
			_css = css;
			
			_width = 200;
			_height = 200;
			_columns = 2;
			_margin = 10;
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function setupText() : void
		{
			var i : int;
			var text : BasicText;
			var firstText : BasicText;
			var lines : int;
			var columnText : String;
			
			_columnWidth = _width / _columns - ((_columns - 1) * _margin) / _columns;
			_texts = new Vector.<BasicText>();
			
			for(i = 0; i < _columns; i++)
			{
				text = new BasicText(columnText || _content, _textFormat, _css);
				text.x = int((_columnWidth + _margin) * i);
				text.textField.autoSize = TextFieldAutoSize.NONE;
				text.textField.wordWrap = true;
				text.textField.width = _columnWidth;
				text.textField.height = _height;
				text.pixelFont = _pixelFont;
				addChild(text);
				_texts.push(text);
				
				if(i == 0)
				{
					firstText = text;
					lines = firstText.textField.bottomScrollV;
					if(lines >= text.textField.numLines) return;
				}
				if(lines * (i) + lines >= firstText.textField.numLines) break;
				
				columnText = getText(firstText.textField, lines * (i + 1), lines);
			}
			
			firstText.htmlText = getText(firstText.textField, 0, lines);
		}
		
		protected function removeText() : void
		{
			if(_texts == null) return;
			
			for each(var text : BasicText in _texts)
			{
				text.dispose();
				safeRemoveChild(text);
			}
			_texts = null;
		}
		
		protected function getText(textField : TextField, start : int, numLines : int) : String
		{
			var i : int;
			var length : int = Math.min(start + numLines, textField.numLines);
			var content : String = "";
			
			for(i = start; i < length; i++)
			{
				content += textField.getLineText(i);
			}
			return content;
		}
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Apply the column change. It's essential to call this method every time you update something on your class
		 */
		public function apply() : void
		{
			removeText();
			setupText();
		}
		
		/**
		 * Dispose
		 */
		public function dispose() : void
		{
			removeText();
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Get all BasicText instances used to create the columns
		 */
		public function get texts() : Vector.<BasicText>
		{
			return _texts;
		}
		
		/**
		 * Text Content
		 */
		public function set text(value : String) : void
		{
			_content = value;
			
			apply();
		}
		
		/**
		 * HTML Content
		 */
		public function set htmlText(value : String) : void
		{
			_content = value;
			
			apply();
		}
		
		/**
		 * TextFormat
		 */
		public function set textFormat(value : TextFormat) : void
		{
			_textFormat = value;
			
			apply();
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
			
			apply();
		}

		public function get css() : StyleSheet
		{
			return _css;
		}
		
		/**
		 * Set if the text is a pixel font or not (actually it will only change the AntiAliasType)
		 */
		public function set pixelFont(value : Boolean) : void
		{
			_pixelFont = value;
			
			if(_texts)
			{
				for each(var text : BasicText in _texts)
				{
					text.textField.antiAliasType = value ? AntiAliasType.NORMAL : AntiAliasType.ADVANCED;
				}
			}
		}
		
		public function get pixelFont() : Boolean
		{
			return _pixelFont;
		}
		
		/**
		 * Text width
		 */
		override public function set width(value : Number) : void
		{
			_width = value;
		}
		
		override public function get width() : Number
		{
			return _width;
		}
		
		/**
		 * Text height
		 */
		override public function set height(value : Number) : void
		{
			_height = value;
		}
		
		override public function get height() : Number
		{
			return _height;
		}
		
		/**
		 * Number of columns
		 */
		public function set columns(value : int) : void
		{
			_columns = Math.max(1, value);
		}
		
		public function get columns() : int
		{
			return _columns;
		}
		
		/**
		 * Margin between the columns
		 */
		public function set margin(value : int) : void
		{
			_margin = value;
		}
		
		public function get margin() : int
		{
			return _margin;
		}

	}
}
