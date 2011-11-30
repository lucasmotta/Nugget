package fashion.nugget.display
{
	import flash.display.GradientType;
	import flash.geom.Matrix;


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * Create a rectangular shape with a gradient fill
	 */
	public class GradientBox extends Box
	{
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _angle : Number;
		
		protected var _colors : Array;
				protected var _ratios : Array;
				protected var _alphas : Array;
		
		protected var _type : String;
		
		protected var _matrix : Matrix;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 * 
		 * @param width			Box width
		 * @param height		Box height
		 * @param angle			Angle of your gradient in degrees
		 * @param colors		Array with the colors of your gradient
		 * @param ratios		Array with the ratio of the colors on your gradient (values between 0-255)
		 * @param alphas		Array with the alpha of your colors
		 * @param type			Type of you gradient (linear or radial)
		 * 
		 */
		public function GradientBox(width : Number, height : Number, angle : Number, colors : Array, ratios : Array = null, alphas : Array = null, type : String = GradientType.LINEAR)
		{
			_angle = angle;
			_colors = colors;			_ratios = ratios || fixRatio();			_alphas = alphas || fixAlpha();
			_type = type;
			
			super(0, width, height);
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function fixAlpha() : Array
		{
			var i : int = Math.max(_colors.length, _ratios.length);
			var array : Array = [];
			while(i--)
			{
				array.push(1);
			}
			return array;
		}
		
		protected function fixRatio() : Array
		{
			var i : int = 0;
			var length : int = _colors.length;
			var array : Array = [];
			for(i = 0; i < length; i++)
			{
				array.push((i / (length - 1)) * 255);
			}
			return array;
		}
		
		override protected function redraw() : void
		{
			_matrix = new Matrix();
			_matrix.createGradientBox(_width, _height, (_angle / 180) * Math.PI);
			//
			this.graphics.clear();
			this.graphics.beginGradientFill(_type, _colors, _alphas, _ratios, _matrix);
			_roundness == 0 ? this.graphics.drawRect(0, 0, _width, _height) : this.graphics.drawRoundRect(0, 0, _width, _height, _roundness);
			this.graphics.endFill();
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Set the colors of your gradient
		 */
		public function set colors(value : Array) : void
		{
			_colors = value;
			//
			redraw();
		}
		
		public function get colors() : Array
		{
			return _colors;
		}
		
		/**
		 * The ratio of the colors of your gradient
		 */
		public function set ratios(value : Array) : void
		{
			_ratios = value;
			//
			redraw();
		}
		
		public function get ratios() : Array
		{
			return _ratios;
		}
		
		/**
		 * The alpha of the colors of your gradient
		 */
		public function set alphas(value : Array) : void
		{
			_alphas = value;
			//
			redraw();
		}
		
		public function get alphas() : Array
		{
			return _alphas;
		}
		
		/**
		 * Gradient angle in degrees
		 */
		public function set angle(value : Number) : void
		{
			_angle = value;
			//
			redraw();
		}
		
		public function get angle() : Number
		{
			return _angle;
		}
		
		/**
		 * Gradient type
		 */
		public function set type(value : String) : void
		{
			_type = value;
			//
			redraw();
		}
		
		public function get type() : String
		{
			return _type;
		}
	}
}
