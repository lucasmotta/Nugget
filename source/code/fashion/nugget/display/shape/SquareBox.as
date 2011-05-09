package fashion.nugget.display.shape
{

	import flash.display.Shape;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class SquareBox extends Shape
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
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function SquareBox(color : uint, width : Number, height : Number)
		{
			_color = color;
			_width = _originalWidth = width;
			_height = _originalHeight = height;
			
			redraw();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function redraw() : void
		{
			this.graphics.clear();
			this.graphics.beginFill(_color);
			this.graphics.drawRect(0, 0, _width, _height);
			this.graphics.endFill();
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
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

	}
}
