package fashion.nugget.abstract
{

	import fashion.nugget.core.IDisposable;
	import fashion.nugget.events.EventDispatcherManager;

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author Lucas Motta
	 */
	public class AbstractButton implements IDisposable
	{
		
		public static const MOUSE_EVENTS : Array = [MouseEvent.CLICK, MouseEvent.DOUBLE_CLICK, MouseEvent.MOUSE_DOWN, MouseEvent.MOUSE_OUT, MouseEvent.MOUSE_OVER, MouseEvent.MOUSE_UP, MouseEvent.ROLL_OUT, MouseEvent.ROLL_OVER];
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private var _view : Sprite;
		
		private var _manager : EventDispatcherManager;
		
		
		protected var _enabled : Boolean;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function AbstractButton(view : Sprite)
		{
			_view = view;
			_manager = new EventDispatcherManager(_view);
			_enabled = true;
			
			_view.buttonMode = true;
			_view.mouseChildren = false;
		}
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Remove all kind of events of this object. 
		 * 
		 * @param ...rest - Event types to remove. If you don't add any parameter, it will remove all events.
		 */
		public function removeEvents(...rest) : void
		{
			_manager.removeEvents(rest);
		}

		/**
		 * Deactivate all kind of events of this object.
		 * 
		 * @param ...rest - Event types to deactivate. If you don't add any parameter, it will deactivate all events.	
		 */
		public function deactivateEvents(...rest) : void
		{
			_manager.deactivateEvents(rest);
		}

		/**
		 * Activate all kind of events of this object.
		 * 
		 * @param ...rest - Event types to activate. If you don't add any parameter, it will activate all events.
		 */
		public function activateEvents(...rest) : void
		{
			_manager.activateEvents(rest);
		}

		/**
		 * Check if a specified event type is active or not
		 * 
		 * @param type - Event Type (e.g. MouseEvent.CLICK, KeyboardEvent.KEY_UP, Event.ENTER_FRAME)
		 */
		public function isEventActive(type : String) : Boolean
		{
			return _manager.isEventActive(type);
		}

		/**
		 * Dispose the object. You can override to add your own stuffs, but don't forget to call the super.
		 */
		public function dispose() : void
		{
			_manager.dispose();
			_manager = null;
			_view = null;
		}
		
		public function addEventListener(type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false) : void 
		{
			var active : Boolean = isEventActive(type);
			
			_manager.addToList(type, listener, useCapture, active);
			if(active) _view.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type : String, listener : Function, useCapture : Boolean = false) : void 
		{
			_manager.removeFromList(type, listener, useCapture);
			
			_view.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event : Event) : Boolean
		{
			return _view.dispatchEvent(event);
		}
		
		public function hasEventListener(type : String) : Boolean
		{
			return _view.hasEventListener(type);
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get view() : Sprite
		{
			return _view;
		}

		public function set view(value : Sprite) : void
		{
			_view = value;
		}
		
		public function get buttonMode() : Boolean
		{
			return _view.buttonMode;
		}

		public function set buttonMode(value : Boolean) : void
		{
			_view.buttonMode = value;
		}
		
		public function get mouseChildren() : Boolean
		{
			return _view.mouseChildren;
		}

		public function set mouseChildren(value : Boolean) : void
		{
			_view.mouseChildren = value;
		}

		public function get enabled() : Boolean
		{
			return _enabled;
		}

		public function set enabled(value : Boolean) : void
		{
			if(_enabled == value) return;
			_enabled = value;
			_enabled ? activateEvents.apply(undefined, AbstractButton.MOUSE_EVENTS) : deactivateEvents.apply(undefined, AbstractButton.MOUSE_EVENTS);
			this.buttonMode = value;
		}
		
	}
}
