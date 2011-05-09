package fashion.nugget.display.scroll
{

	import fashion.nugget.core.IDisposable;
	import fashion.nugget.display.shape.SquareBox;
	import fashion.nugget.util.number.limit;
	import fashion.nugget.view.View;

	import flash.display.DisplayObject;
	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class ScrollMouse extends View implements IDisposable
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _content : DisplayObject;
		
		protected var _mask : SquareBox;
		
		protected var _posx : Number;
		
		protected var _posy : Number;
		
		protected var _width : Number = 200;
		
		protected var _height : Number = 200;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function ScrollMouse(content : DisplayObject)
		{
			_content = content;
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
			
		override protected function init() : void
		{
			addChild(_content);
			
			_mask = new SquareBox(0, _width, _height);
			addChild(_mask);
			
			this.addEventListener(Event.ENTER_FRAME, onUpdateScroll);
		}
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onUpdateScroll(e : Event) : void
		{
			_posx = limit(-(mouseX / _width) * (_content.width - _width), _width - _content.width, 0);
			_posy = limit(-(mouseY / _height) * (_content.height - _height), _height - _content.height, 0);
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function dispose() : void
		{
			if(_mask)
			{
				_mask.removeEventListener(Event.ENTER_FRAME, onUpdateScroll);
				_mask = null;
			}
			if(_content)
			{
				_content = null;
			}
			super.dispose();
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get content() : DisplayObject
		{
			return _content;
		}
		
		public function get posx() : Number
		{
			return _posx;
		}
		
		public function get posy() : Number
		{
			return _posy;
		}
			
		override public function set width(value : Number) : void
		{
			_width = value;
			if(this.ready)
			{
				_mask.width = _width;
			}
		}

		override public function get width() : Number
		{
			return _width;
		}
		
		override public function set height(value : Number) : void
		{
			_height = value;
			if(this.ready)
			{
				_mask.height = _height;
			}
		}

		override public function get height() : Number
		{
			return _height;
		}


	}
}
