package fashion.nugget.display
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class Border extends Box
	{

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _thickness : Number;
		
		protected var _innerStroke : Boolean;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Border(color : uint, width : Number, height : Number, thickness : Number, innerStroke : Boolean = true)
		{
			_thickness = thickness;
			_innerStroke = innerStroke;

			super(color, width, height);
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function redraw() : void
		{
			this.graphics.clear();
			this.graphics.beginFill(_color);
			if(_innerStroke)
			{
				_radius == 0 ? this.graphics.drawRect(0, 0, _width, _height) : this.graphics.drawRoundRect(0, 0, _width, _height, _radius);
				_radius == 0 ? this.graphics.drawRect(_thickness, _thickness, _width - _thickness * 2, _height - _thickness * 2) : this.graphics.drawRoundRect(_thickness, _thickness, _width - _thickness * 2, _height - _thickness * 2, _radius);
			}
			else
			{
				_radius == 0 ? this.graphics.drawRect(-_thickness, -_thickness, _width + _thickness * 2, _height + _thickness * 2) : this.graphics.drawRoundRect(-_thickness, -_thickness, _width + _thickness * 2, _height + _thickness * 2, _radius);
				_radius == 0 ? this.graphics.drawRect(0, 0, _width, _height) : this.graphics.drawRoundRect(0, 0, _width, _height, _radius);
			}
			this.graphics.endFill();
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
		public function set thickness(value : Number) : void
		{
			_thickness = value;

			redraw();
		}

		public function get thickness() : Number
		{
			return _thickness;
		}
	}
}
