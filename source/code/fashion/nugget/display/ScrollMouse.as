package fashion.nugget.display
{

	import fashion.nugget.util.number.limit;

	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * Scroll through a DisplayObject using your mouse. Usefull for pictures and big objects.
	 */
	public class ScrollMouse extends SpriteExtended
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _content : DisplayObject;
		
		protected var _mask : Box;
		
		protected var _background : Box;
		
		
		protected var _posx : Number;
		
		protected var _posy : Number;
		
		protected var _width : Number;
		
		protected var _height : Number;
		
		protected var _easing : Number;
		
		protected var _lockX : Boolean;
		
		protected var _lockY : Boolean;
		
		
		protected var _active : Boolean;
		
		protected var _leftMouseX : Number;
		
		protected var _leftMouseY : Number;
		
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 * 
		 * @param content		Your DisplayObject
		 * @param width			Width of the visible area
		 * @param height		Height of the visible area
		 * @param easing		Easing of the animation (smaller number = bigger duration)
		 */
		public function ScrollMouse(content : DisplayObject, width : Number = 200, height : Number = 200, easing : Number = .1)
		{
			_content = content;
			_width = width;
			_height = height;
			_easing = easing;
			_posx = 0;
			_posy = 0;
			_leftMouseX = 0;
			_leftMouseY = 0;
			
			this.x = _content.x;
			this.y = _content.y;
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			_mask = new Box(0, _width, _height);
			addChild(_mask);
			
			_background = new Box(0xFFFF00, _width, _height);
			_background.alpha = 0;
			addChild(_background);
			
			_content.x = 0;
			_content.y = 0;
			_content.mask = _mask;
			addChild(_content);
			
			this.addEventListener(MouseEvent.ROLL_OVER, onItemOver);
			this.addEventListener(MouseEvent.ROLL_OUT, onItemOut);
			this.addEventListener(Event.ENTER_FRAME, onUpdateScroll);
		}

		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onItemOver(e : MouseEvent) : void
		{
			_active = true;
			_leftMouseX = 0;
			_leftMouseY = 0;
		}
		
		protected function onItemOut(e : MouseEvent) : void
		{
			_active = false;
			_leftMouseX = mouseX;
			_leftMouseY = mouseY;
		}
		
		protected function onUpdateScroll(e : Event) : void
		{
			var mx : Number = _active ? mouseX : _leftMouseX;
			var my : Number = _active ? mouseY : _leftMouseY;
			
			_posx += (-(mx / _width) * (_content.width - _width) - _content.x) * _easing;
			_posy += (-(my / _height) * (_content.height - _height) - _content.y) * _easing;
			_posx = limit(_posx, _width - _content.width, 0);
			_posy = limit(_posy, _height - _content.height, 0);
			
			if(!_lockX) _content.x = _posx;
			if(!_lockY) _content.y = _posy;
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function dispose() : void
		{
			if(_mask)
			{
				_mask = null;
			}
			if(_content)
			{
				_content = null;
			}
			this.removeEventListener(Event.ENTER_FRAME, onUpdateScroll);
			this.removeEventListener(MouseEvent.ROLL_OVER, onItemOver);
			this.removeEventListener(MouseEvent.ROLL_OUT, onItemOut);
			
			super.dispose();
		}
		
		public function reset() : void
		{
			_posx = _posy = 0;
			_content.x = _posx;
			_content.y = _posy;
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get content() : DisplayObject
		{
			return _content;
		}
		
		/**
		 * Width of your scroll
		 */
		override public function set width(value : Number) : void
		{
			_width = value;
			if(this.ready)
			{
				_mask.width = _width;
				_background.width = _width;
			}
		}

		override public function get width() : Number
		{
			return _width;
		}
		
		/**
		 * Height of you scroll
		 */
		override public function set height(value : Number) : void
		{
			_height = value;
			if(this.ready)
			{
				_mask.height = _height;
				_background.height = _height;
			}
		}

		override public function get height() : Number
		{
			return _height;
		}
		
		public function get easing() : Number
		{
			return _easing;
		}

		public function set easing(easing : Number) : void
		{
			_easing = easing;
		}
		
		/** 
		 * Lock the x position
		 */
		public function get lockX() : Boolean
		{
			return _lockX;
		}

		public function set lockX(lockX : Boolean) : void
		{
			_lockX = lockX;
		}
		
		
		/** 
		 * Lock the y position
		 */
		public function get lockY() : Boolean
		{
			return _lockY;
		}

		public function set lockY(lockY : Boolean) : void
		{
			_lockY = lockY;
		}


	}
}
