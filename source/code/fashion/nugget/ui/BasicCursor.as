package fashion.nugget.ui
{

	import fashion.nugget.core.ICursor;
	import fashion.nugget.view.NuggetView;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class BasicCursor extends NuggetView implements ICursor
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _view : MovieClip;
		
		protected var _showing : Boolean;
		
		protected var _hasEvent : Boolean;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function BasicCursor(view : MovieClip)
		{
			_showing = this.visible = false;
			this.mouseEnabled = false;
			
			_view = view;
			_view.stop();
			addChild(_view);
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			if(_showing)
			{
				addMouseMove();
			}
		}
		
		protected function addMouseMove() : void
		{
			if(_hasEvent) return;
			_hasEvent = true;
			
			Mouse.hide();
			onMouseMove();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		protected function removeMouseMove() : void
		{
			if(!_hasEvent) return;
			_hasEvent = false;
			
			Mouse.show();
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onMouseMove(e : MouseEvent = null) : void
		{
			this.x = this.nugget.container.mouseX;
			this.y = this.nugget.container.mouseY;
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function press() : void
		{
			show();
			
			_view.gotoAndStop("press");
		}

		public function release() : void
		{
			show();
			
			_view.gotoAndStop("release");
		}

		public function rollOver() : void
		{
			show();
			
			_view.gotoAndStop("rollOver");
		}

		public function rollOut() : void
		{
			show();
			
			_view.gotoAndStop("rollOut");
		}
		
		public function drag() : void
		{
			show();
			
			_view.gotoAndStop("drag");
		}
		
		public function dragStop() : void
		{
			show();
			
			_view.gotoAndStop("dragStop");
		}

		public function show() : void
		{
			this.bringToFront();
			this.showing = true;
		}

		public function close() : void
		{
			Mouse.show();
			this.showing = false;
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function set showing(value : Boolean) : void
		{
			this.visible = value;
			
			if(_showing == value) return;
			_showing = value;
			
			if(this.stage == null) return;
			_showing ? addMouseMove() : removeMouseMove();
		}
		
		public function get showing() : Boolean
		{
			return _showing;
		}
	}
}

