package fashion.nugget.display.shape
{

	import flash.display.GradientType;
	import flash.geom.Matrix;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class RoundedGradientBox extends GradientBox
	{
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private var _radius : Number;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function RoundedGradientBox(width : Number, height : Number, radius : Number, angle : Number, colors : Array, ratios : Array, alphas : Array = null, type : String = GradientType.LINEAR)
		{
			_radius = radius;
			
			super(width, height, angle, colors, ratios, alphas, type);
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function redraw() : void
		{
			_matrix = new Matrix();
			_matrix.createGradientBox(_width, _height, (_angle / 180) * Math.PI);
			//
			this.graphics.clear();
			this.graphics.beginGradientFill(_type, _colors, _alphas, _ratios, _matrix);
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
