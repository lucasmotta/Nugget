package fashion.nugget.events
{

	import fashion.nugget.core.IDisposable;

	import flash.events.EventDispatcher;

	/**
	 * EventDispatcher + NuListenerManager
	 * Now you can use the same features of the NuListenerManager, such as removeEvents, activateEvents, deactivateEvents
	 * 
	 * @author Lucas Motta (lucasmotta.com)
	 * @since Jun 8, 2010
	 */
	public class EventDispatcherExtended extends EventDispatcher implements IDisposable
	{

		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private var _manager : EventDispatcherManager;

		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function EventDispatcherExtended()
		{
			// Create the dispatcher
			_manager = new EventDispatcherManager(this);
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
			// DISPOSE EVENTS
			removeEvents();
		}
		
		/**
		 * @excludeInherit
		 * @exclude
		 */
		override public function addEventListener(type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false) : void 
		{
			var active : Boolean = isEventActive(type);
			
			_manager.addToList(type, listener, useCapture, active);
			if(active) super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}

		/**
		 * @excludeInherit
		 * @exclude
		 */
		override public function removeEventListener(type : String, listener : Function, useCapture : Boolean = false) : void 
		{
			_manager.removeFromList(type, listener, useCapture);
			
			super.removeEventListener(type, listener, useCapture);
		}
	}
}