package fashion.nugget.display
{


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * Create a rectangular shape
	 */
	public class Box extends SpriteExtended
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _color : uint;
		
		protected var _width : Number;
		
		protected var _height : Number;
		
		protected var _originalWidth : Number;
		
		protected var _originalHeight : Number;
		
		protected var _roundness : Number;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 * 
		 * @param color			Color of your box
		 * @param width			Width of your box
		 * @param height		Height of your box
		 */
		public function Box(color : uint, width : Number, height : Number)
		{
			_color = color;
			_width = _originalWidth = width;
			_height = _originalHeight = height;
			_roundness = 0;
			
			redraw();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function redraw() : void
		{
			this.graphics.clear();
			this.graphics.beginFill(_color);
			_roundness == 0 ? this.graphics.drawRect(0, 0, _width, _height) : this.graphics.drawRoundRect(0, 0, _width, _height, _roundness);
			this.graphics.endFill();
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Box width
		 */
		override public function set width(value : Number) : void
		{
			_width = value;
			//
			redraw();
		}
			
		override public function get width() : Number
		{
			return _width;
		}
		
		/**
		 * Box height
		 */
		override public function set height(value : Number) : void
		{
			_height = value;
			//
			redraw();
		}
			
		override public function get height() : Number
		{
			return _height;
		}
		
		
		override public function set scaleX(value : Number) : void
		{
			_width = _originalWidth * value;
			//
			redraw();
		}
			
		override public function get scaleX() : Number
		{
			return _width / _originalWidth;
		}
		
		override public function set scaleY(value : Number) : void
		{
			_height = _originalHeight * value;
			//
			redraw();
		}
			
		override public function get scaleY() : Number
		{
			return _height / _originalHeight;
		}
		
		/**
		 * Color of your box
		 */
		public function set color(value : uint) : void
		{
			_color = value;
			//
			redraw();
		}
		
		public function get color() : uint
		{
			return _color;
		}
		
		/**
		 * Roundness of the corners
		 */
		public function set roundness(value : Number) : void
		{
			_roundness = value;
			//
			redraw();
		}
		
		public function get roundness() : Number
		{
			return _roundness;
		}

	}
}
