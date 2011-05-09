package fashion.nugget.display.shape
{


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class RoundedBox extends SquareBox
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		
		protected var _radius : Number;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function RoundedBox(color : uint, width : Number, height : Number, radius : Number)
		{
			_radius = radius;
			
			super(color, width, height);
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function redraw() : void
		{
			this.graphics.clear();
			this.graphics.beginFill(_color);
			this.graphics.drawRoundRect(0, 0, _width, _height, _radius);
			this.graphics.endFill();
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------		
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
