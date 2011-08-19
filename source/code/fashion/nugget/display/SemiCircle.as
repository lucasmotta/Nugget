package fashion.nugget.display
{
	/**
	 * @author zeh (http://zeh.com.br)
	 */
	public class SemiCircle extends SpriteExtended
	{

		// ----------------------------------------------------
		// CONSTANTS
		// ----------------------------------------------------
		protected static const STEP_SIZE : Number = 3;

		// Drawing steps, in degrees.
		protected static const BASE_ANGLE : Number = 0;

		// Where is the actual starting 0°, in degrees
		protected static const A_TO_R : Number = Math.PI / 180;

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _color : Number;

		protected var _radius : Number;

		protected var _innerRadius : Number;

		protected var _startAngle : Number;

		protected var _endAngle : Number;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function SemiCircle(radius : Number = 100, color : int = 0xff0000, innerRadius : Number = 0, startAngle : Number = 0, endAngle : Number = 360)
		{
			_color = color & 0xffffff;
			_radius = radius;
			_innerRadius = innerRadius;
			_startAngle = startAngle;
			_endAngle = endAngle;

			checkProperties();
			redraw();
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function redraw() : void
		{
			graphics.clear();

			var i : Number;
			var a : Number;
			// Temp angle

			graphics.lineStyle();
			graphics.beginFill(_color, 1);

			// Outer arc
			a = (_startAngle + BASE_ANGLE) * A_TO_R;
			graphics.moveTo(Math.cos(a) * _radius, Math.sin(a) * _radius);

			for (i = _startAngle + STEP_SIZE; i < _endAngle; i += STEP_SIZE)
			{
				a = (i + BASE_ANGLE) * A_TO_R;
				graphics.lineTo(Math.cos(a) * _radius, Math.sin(a) * _radius);
			}

			a = (_endAngle + BASE_ANGLE) * A_TO_R;
			graphics.lineTo(Math.cos(a) * _radius, Math.sin(a) * _radius);

			// Inner arc, inverse
			if (_innerRadius > 0)
			{
				for (i = _endAngle; i > _startAngle; i -= STEP_SIZE)
				{
					a = (i + BASE_ANGLE) * A_TO_R;
					graphics.lineTo(Math.cos(a) * _innerRadius, Math.sin(a) * _innerRadius);
				}

				a = (_startAngle + BASE_ANGLE) * A_TO_R;
				graphics.lineTo(Math.cos(a) * _innerRadius, Math.sin(a) * _innerRadius);
			}
			else
			{
				graphics.lineTo(0, 0);
			}

			graphics.endFill();
		}

		protected function checkProperties() : void
		{
			if (isNaN(_startAngle)) _startAngle = 0;
			_startAngle = clamp(_startAngle, -65535, 65535);

			if (isNaN(_endAngle)) _endAngle = 360;
			_endAngle = clamp(_endAngle, -65535, 65535);
		}

		protected function clamp(__value : Number, __min : Number = 0, __max : Number = 1) : Number
		{
			return __value < __min ? __min : __value > __max ? __max : __value;
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
		public function get color() : int
		{
			return _color;
		}

		public function set color(value : int) : void
		{
			if (_color != value)
			{
				_color = value;
				redraw();
			}
		}

		public function get radius() : Number
		{
			return _radius;
		}

		public function set radius(value : Number) : void
		{
			if (_radius != value)
			{
				_radius = value;
				redraw();
			}
		}

		public function get innerRadius() : Number
		{
			return _innerRadius;
		}

		public function set innerRadius(value : Number) : void
		{
			if (_innerRadius != value)
			{
				_innerRadius = value;
				redraw();
			}
		}

		public function get startAngle() : Number
		{
			return _startAngle;
		}

		public function set startAngle(value : Number) : void
		{
			if (_startAngle != value)
			{
				_startAngle = value;
				checkProperties();
				redraw();
			}
		}

		public function get endAngle() : Number
		{
			return _endAngle;
		}

		public function set endAngle(value : Number) : void
		{
			if (_endAngle != value)
			{
				_endAngle = value;
				checkProperties();
				redraw();
			}
		}
	}
}