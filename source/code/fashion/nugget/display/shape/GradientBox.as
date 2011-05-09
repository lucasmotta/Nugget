package fashion.nugget.display.shape
{
	import flash.display.GradientType;
	import flash.geom.Matrix;


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class GradientBox extends SquareBox
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
		 */
		public function GradientBox(width : Number, height : Number, angle : Number, colors : Array, ratios : Array, alphas : Array = null, type : String = GradientType.LINEAR)
		{
			_angle = angle;
			_colors = colors;			_ratios = ratios;			_alphas = alphas || fixAlpha();
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
		
		override protected function redraw() : void
		{
			_matrix = new Matrix();
			_matrix.createGradientBox(_width, _height, (_angle / 180) * Math.PI);
			//
			this.graphics.clear();
			this.graphics.beginGradientFill(_type, _colors, _alphas, _ratios, _matrix);
			this.graphics.drawRect(0, 0, _width, _height);
			this.graphics.endFill();
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		
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
