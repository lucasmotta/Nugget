package fashion.nugget.text
{

	import flash.text.StyleSheet;
	import fashion.nugget.display.GradientBox;
	import fashion.nugget.util.display.safeRemoveChild;

	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	import flash.text.TextLineMetrics;


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class GradientText extends BasicText
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _mask : Sprite;

		protected var _colors : Array;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function GradientText(content : String, colors : Array, format : TextFormat = null)
		{
			_colors = colors;
			
			super(content, format, css);
			
			createMask();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function createMask() : void
		{
			var i : int;
			var length : int = _textField.numLines;
			var box : GradientBox;
			var metrics : TextLineMetrics;
			var rect : Rectangle;
			
			if(_mask)
			{
				_mask.mask = null;
				safeRemoveChild(_mask);
				_mask = null;
			}
			
			_mask = new Sprite();
			addChildAt(_mask, 0);
			
			// TODO I have to change the text height because of a weird bug with getCharBoundaries
			_textField.height = _textField.textHeight + 5;
			
			for(i = 0; i < length; i++)
			{
				if(i >= _textField.numLines) break;
				rect = _textField.getCharBoundaries(_textField.getLineOffset(i));
				metrics = _textField.getLineMetrics(i);
				if(rect == null || metrics == null) continue;
				
				box = new GradientBox(metrics.width + metrics.x, rect.height, 90, _colors, null);
				box.y = rect.y;
				_mask.addChild(box);
			}
			
			_mask.cacheAsBitmap = _textField.cacheAsBitmap = true;
			_mask.mask = _textField;
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function toBitmap() : void
		{
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		override public function set htmlText(value : String) : void
		{
			super.htmlText = value;
			createMask();
		}

		override public function set text(value : String) : void
		{
			super.text = value;
			createMask();
		}
		
		override public function set width(value : Number) : void
		{
			super.width = value;
			createMask();
		}

		override public function set height(value : Number) : void
		{
			super.height = value;
			createMask();
		}

		override public function set textFormat(value : TextFormat) : void
		{
			super.textFormat = value;
			createMask();
		}
		
		override public function set css(value : StyleSheet) : void
		{
			super.css = value;
			createMask();
		}
		
		override public function set multiline(value : Boolean) : void
		{
			super.multiline = value;
			createMask();
		}

		public function get colors() : Array
		{
			return _colors;
		}

		public function set colors(colors : Array) : void
		{
			_colors = colors;
			createMask();
		}

	}
}
