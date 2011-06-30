package fashion.nugget.display
{

	import flash.display.Sprite;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class Box extends Sprite
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
		
		protected var _radius : Number;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Box(color : uint, width : Number, height : Number)
		{
			_color = color;
			_width = _originalWidth = width;
			_height = _originalHeight = height;
			_radius = 0;
			
			redraw();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function redraw() : void
		{
			this.graphics.clear();
			this.graphics.beginFill(_color);
			_radius == 0 ? this.graphics.drawRect(0, 0, _width, _height) : this.graphics.drawRoundRect(0, 0, _width, _height, _radius);
			this.graphics.endFill();
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Width
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
		 * Height
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
		
		/**
		 * Scale X
		 */
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
		
		/**
		 * Scale Y
		 */
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
		 * Color
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
		 * Radius
		 */
		public function set radius(value : Number) : void
		{
			_radius = value;
			//
			redraw();
		}
		
		public function get radius() : Number
		{
			return _radius;
		}

	}
}
