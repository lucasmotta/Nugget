package fashion.nugget.display
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * Simple way to create a border / stroke (rectangle shape)
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
		 * 
		 * @param color			Color of you border
		 * @param width			Border width
		 * @param height		Border height
		 * @param thickness		Thickness of your border
		 * @param innerStroke	Inner stroke or outer stroke
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
				_roundness == 0 ? this.graphics.drawRect(0, 0, _width, _height) : this.graphics.drawRoundRect(0, 0, _width, _height, _roundness);
				_roundness == 0 ? this.graphics.drawRect(_thickness, _thickness, _width - _thickness * 2, _height - _thickness * 2) : this.graphics.drawRoundRect(_thickness, _thickness, _width - _thickness * 2, _height - _thickness * 2, _roundness);
			}
			else
			{
				_roundness == 0 ? this.graphics.drawRect(-_thickness, -_thickness, _width + _thickness * 2, _height + _thickness * 2) : this.graphics.drawRoundRect(-_thickness, -_thickness, _width + _thickness * 2, _height + _thickness * 2, _roundness);
				_roundness == 0 ? this.graphics.drawRect(0, 0, _width, _height) : this.graphics.drawRoundRect(0, 0, _width, _height, _roundness);
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
		/**
		 * Border Thickness
		 */
		public function set thickness(value : Number) : void
		{
			_thickness = value;

			redraw();
		}

		public function get thickness() : Number
		{
			return _thickness;
		}
		
		/**
		 * Set if the border will be an inner or outer border
		 */
		public function set innerStroke(value : Boolean) : void
		{
			_innerStroke = value;
		}
		
		public function get innerStroke() : Boolean
		{
			return _innerStroke;
		}

		
	}
}
