package fashion.nugget.text
{

	import fashion.nugget.display.Box;
	import fashion.nugget.util.display.getVisualBounds;
	import fashion.nugget.util.display.safeRemoveChild;
	import fashion.nugget.util.validation.isEmpty;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextLineMetrics;



	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class LineText extends Sprite
	{

		public static const ALIGN_LEFT : String = "left";

		public static const ALIGN_RIGHT : String = "right";

		public static const ALIGN_CENTER : String = "center";

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private var _source : TextField;

		private var _lineRect : Rectangle;

		private var _textWidth : int;
		
		private var _lines : Vector.<TextField>;

		private var _bgs : Vector.<Box>;

		private var _leading : int;

		private var _align : String;

		private var _background : LineTextBackground;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function LineText(source : TextField, align : String = null, leading : Number = 2)
		{
			_source = source;
			_align = align || LineText.ALIGN_LEFT;
			_leading = leading;
			_textWidth = _source.width;
			_lineRect = getLineRect();

			_lines = new Vector.<TextField>();
			_bgs = new Vector.<Box>();

			setupLines();
			fixPos();
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function setupLines() : void
		{
			var i : int;
			var length : int = _source.numLines;
			//
			for(i = 0; i < length; i++)
			{
				createLine(i);
			}
			
			if(_source.parent != null)
			{
				_source.parent.addChild(this);
				safeRemoveChild(_source);
			}
		}

		protected function createLine(id : int, addText : Boolean = true) : TextField
		{
			var text : String = _source.getLineText(id);
			var lastChar : String = text.slice(0, text.length - 1);
			if(lastChar == " ")
			{
				text = text.slice(0, text.length - 1);
			}
			//
			var line : TextField = new TextField();
			line.defaultTextFormat = _source.defaultTextFormat;
			line.multiline = false;
			line.selectable = false;
			line.mouseWheelEnabled = false;
			line.autoSize = TextFieldAutoSize.LEFT;
			line.antiAliasType = _source.antiAliasType;
			line.embedFonts = _source.embedFonts;
			line.filters = _source.filters;
			line.gridFitType = _source.gridFitType;
			line.sharpness = _source.sharpness;
			line.styleSheet = _source.styleSheet;
			line.thickness = _source.thickness;
			line.text = text;
			//
			if(addText)
			{
				_lines.push(line);
				this.addChild(line);
			}
			//
			return line;
		}

		protected function fixPos() : void
		{
			var i : int;
			var length : int = this.lines.length;
			var line : TextField;
			//
			for(i = 0; i < length; i++)
			{
				line = this.lines[i];
				line.x = 0;
				line.y = (_lineRect.height + this.leading) * i;

				switch(this.align)
				{
					case LineText.ALIGN_RIGHT :
						line.x = int(_textWidth - line.width);
						break;
					case LineText.ALIGN_CENTER :
						line.x = int(_textWidth * .5 - line.width * .5);
						break;
				}
			}
		}

		protected function fixBackground() : void
		{
			removeBackground();
			//
			if(this.background == null)
			{
				return;
			}
			//
			var i : int;
			var length : int = this.lines.length;
			var metrics : TextLineMetrics;
			var rect : Rectangle;
			var line : TextField;
			var shape : Box;

			for(i = 0; i < length; i++)
			{
				line = this.lines[i];
				if(isEmpty(line.text))
				{
					continue;
				}
				metrics = line.getLineMetrics(0);
				rect = getVisualBounds(line, line.width + 20, line.height + 20);
				rect.width = Math.round(rect.width);
				//
				shape = new Box(this.background.color, 50, 50);
				shape.y = Math.round(line.y + _lineRect.y - this.background.padding);
				shape.width = Math.round(rect.width + this.background.padding * 2);
				shape.height = Math.round(_lineRect.height + this.background.padding * 2);
				_bgs[_bgs.length] = shape;
				addChildAt(shape, i);
				//
				switch(this.align)
				{
					case LineText.ALIGN_LEFT :
						shape.x = Math.round(line.x + _lineRect.x - this.background.padding);
					break;
					case LineText.ALIGN_RIGHT :
						shape.x = Math.round(_textWidth - shape.width);
					break;
					case LineText.ALIGN_CENTER:
						shape.x = Math.round(_textWidth * .5 - shape.width * .5 - _lineRect.x);
					break;
				}
			}
		}

		protected function removeBackground() : void
		{
			if(_bgs.length == 0)
			{
				return;
			}
			//
			var i : int;
			var length : int = _bgs.length;

			for(i = 0; i < length; i++)
			{
				safeRemoveChild(_bgs[i]);
			}
			_bgs.length = 0;
		}
		
		protected function getLineRect() : Rectangle
		{
			var textField : TextField = createLine(0, false);
			textField.text = "ABC";
			var rect : Rectangle = getVisualBounds(textField, textField.width + 20, textField.height + 20);
			rect.x = Math.round(rect.x);
			rect.y = Math.round(rect.y);
			rect.width = Math.round(rect.width);
			rect.height = Math.round(rect.height);
			return rect;
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
		/**
		 * Get all the lines (texfields)
		 */
		public function get lines() : Vector.<TextField>
		{
			return _lines;
		}

		/**
		 * Set the textfield align (left, right, center)
		 */
		public function get align() : String
		{
			return _align;
		}

		public function set align(value : String) : void
		{
			_align = value;
			fixPos();
			fixBackground();
		}

		/**
		 * Set the leading (distance between lines)
		 */
		public function get leading() : int
		{
			return _leading;
		}

		public function set leading(value : int) : void
		{
			_leading = value;
			fixPos();
			fixBackground();
		}

		/**
		 * Set the background color for each line
		 */
		public function get background() : LineTextBackground
		{
			return _background;
		}

		public function set background(value : LineTextBackground) : void
		{
			_background = value;
			fixBackground();
		}
	}
}
