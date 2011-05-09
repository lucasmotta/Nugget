package fashion.nugget.text
{

	import fashion.nugget.util.display.getVisualBounds;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextLineMetrics;


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class TextLine extends Sprite
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

		private var _lineHeight : int;

		private var _textWidth : int;
		
		private var _lines : Array;

		private var _bgs : Array;

		private var _leading : int = 2;

		private var _align : String = TextLine.ALIGN_LEFT;

		private var _background : TextLineBackground;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function TextLine(source : TextField)
		{
			_source = source;
			_textWidth = _source.width;
			_lineHeight = getLineHeight();

			_lines = [];
			_bgs = [];

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

			// Remove the textfield
			if(Boolean(_source.parent))
			{
				_source.parent.removeChild(_source);
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
				_lines[_lines.length] = line;
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
				line.y = (_lineHeight + this.leading) * i;

				switch(this.align)
				{
					case TextLine.ALIGN_RIGHT :
						line.x = int(_textWidth - line.width);
						break;
					case TextLine.ALIGN_CENTER :
						line.x = int(_textWidth * .5 - line.width * .5);
						break;
				}
			}
		}

		protected function getLineHeight() : int
		{
			var textField : TextField = createLine(0, false);
			textField.text = "A";
			return getVisualBounds(textField, textField.width + 20, textField.height + 20).height;
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
			var line : TextField;
			var shape : Shape;

			for(i = 0; i < length; i++)
			{
				line = this.lines[i];
				if(isEmpty(line.text))
				{
					continue;
				}
				metrics = line.getLineMetrics(0);
				//
				shape = new Shape();
				shape.graphics.beginFill(this.background.color, 1);
				shape.graphics.drawRect(0, 0, 50, 50);
				shape.x = Math.round(line.x + metrics.x - this.background.padding);
				shape.y = Math.round(line.y + metrics.height - metrics.ascent + metrics.descent - this.background.padding);
				shape.width = Math.round(metrics.width + this.background.padding * 2);
				shape.height = Math.round(_lineHeight + this.background.padding * 2);
				_bgs[_bgs.length] = shape;
				addChildAt(shape, i);
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
			var shape : Shape;

			for(i = 0; i < length; i++)
			{
				shape = _bgs[i];
				shape.parent.removeChild(shape);
			}
			_bgs = [];
		}

		protected function isEmpty(value : String):Boolean
		{
			var str : String = value.replace(/^\s+|\s+$/g, '');
			str = str.replace(/\s+/g, ' ');
			return !str.length;
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
		public function get lines() : Array
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
		public function get background() : TextLineBackground
		{
			return _background;
		}

		public function set background(value : TextLineBackground) : void
		{
			_background = value;
			fixBackground();
		}
	}
}
