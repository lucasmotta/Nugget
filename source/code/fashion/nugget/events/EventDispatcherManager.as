package fashion.nugget.events
{
	import fashion.nugget.core.IDisposable;
	import flash.events.EventDispatcher;

	/**
	 * Listener Manager
	 * 
	 * @see NuEventDispatcher
	 * @see NuLoaderQueue
	 * @see NuLoaderItem
	 * @see NuSprite
	 * 
	 * @author Lucas Motta (lucasmotta.com)
	 * @since Jun 3, 2010
	 */
	public class EventDispatcherManager implements IDisposable
	{

		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _listeners : Object = {};
		
		
		protected var _item : EventDispatcher;

		protected var _allowAddToList : Boolean = true;

		protected var _allowRemoveFromList : Boolean = true;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function EventDispatcherManager(item : EventDispatcher)
		{
			_item = item;
		}

		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		/**
		 * Remove all kind of events frost the list and from the object
		 */
		public function removeEvents(array : Array = null) : void
		{
			var i : int;
			var j : int;
			var type : String;
			array ||= [];
			
			// Allow to remove from the list
			_allowRemoveFromList = true;
			
			// Check if the array is empty
			if(array.length == 0)
			{
				// Create a loop to get all type of events
				for(type in _listeners)
				{
					// Create a loop inside each type of event
					i = _listeners[type]["length"];
					while(i--)
					{
						// Tell the item to remove the events (from the object and from the list)
						_item.removeEventListener(type, _listeners[type][i]["listener"], _listeners[type][i]["useCapture"]);
					}
					// Clear the type if it's empty
					emptyType(type);
				}
			}
			// If you are removing just on type of event
			else
			{
				// Create a loop on each item of the array
				for(j = 0;j < array.length;j++)
				{
					// Get the event type
					type = array[j];
					// Check if this type really exists
					if(_listeners.hasOwnProperty(type))
					{
						// Create a loop inside the listeners to remove the events
						i = _listeners[type]["length"];
						while(i--)
						{
							// Tell the item to remove the events (from the object and from the list)
							_item.removeEventListener(type, _listeners[type][i]["listener"], _listeners[type][i]["useCapture"]);
						}
						// Clear the type if it's empty
						emptyType(type);
					}
				}
			}
		}

		/**
		 * Deactivate all kind of events of this object, but not from the list.
		 */
		public function deactivateEvents(array : Array = null) : void
		{
			var i : int;
			var j : int;
			var type : String;
			array ||= [];
			
			// Not allow to remove from the list, because I just want to remove the event from the object
			_allowRemoveFromList = false;
			
			// Check if the array is empty
			if(array.length == 0)
			{
				// Create a loop to get all type of events
				for(type in _listeners)
				{
					// Create a loop inside each type of event
					i = _listeners[type]["length"];
					while(i--)
					{
						// Check if the item is active
						if(_listeners[type][i]["active"] == true)
						{
							// Deactivate the item
							_listeners[type][i]["active"] = false;
							_item.removeEventListener(type, _listeners[type][i]["listener"], _listeners[type][i]["useCapture"]);
						}
					}
				}
			}
			// If you are removing just on type of event
			else
			{
				// Create a loop on each item of the array
				for(j = 0;j < array.length;j++)
				{
					// Get the event type
					type = array[j];
					// Check if this type really exists
					if(_listeners.hasOwnProperty(type))
					{
						// Create a loop inside the listeners to remove the events
						i = _listeners[type]["length"];
						while(i--)
						{
							// Check if the item is active
							if(_listeners[type][i]["active"] == true)
							{
								// Deactivate the item
								_listeners[type][i]["active"] = false;
								_item.removeEventListener(type, _listeners[type][i]["listener"], _listeners[type][i]["useCapture"]);
							}
						}
					}
				}
			}
			
			// Allow again to remove from the list
			_allowRemoveFromList = true;
		}

		/**
		 * Activate all kind of events of this object based on the events that you've stored on your list.
		 */
		public function activateEvents(array : Array) : void
		{
			var i : int;
			var j : int;
			var type : String;
			array ||= [];
			
			// Not allow to add to the list, because I just want to add the event to the object
			_allowAddToList = false;
			
			// Check if the array is empty
			if(array.length == 0)
			{
				// Create a loop to get all type of events
				for(type in _listeners)
				{
					// Create a loop inside each type of event
					i = _listeners[type]["length"];
					while(i--)
					{
						// Check if the item is deactive
						if(_listeners[type][i]["active"] == false)
						{
							// Activate the item
							_listeners[type][i]["active"] = true;
							_item.addEventListener(type, _listeners[type][i]["listener"], _listeners[type][i]["useCapture"]);
						}
					}
				}
			}
			// If you are removing just on type of event
			else
			{
				// Create a loop on each item of the array
				for(j = 0;j < array.length;j++)
				{
					// Get the event type
					type = array[j];
					// Check if this type really exists
					if(_listeners.hasOwnProperty(type) == true)
					{
						// Create a loop inside the listeners to add the events
						i = _listeners[type]["length"];
						while(i--)
						{
							// Check if the item is deactive
							if(_listeners[type][i]["active"] == false)
							{
								// Activate the item
								_listeners[type][i]["active"] = true;
								_item.addEventListener(type, _listeners[type][i]["listener"], _listeners[type][i]["useCapture"]);
							}
						}
					}
				}
			}
			
			// Allow again to add items to the list
			_allowAddToList = true;
		}

		/**
		 * Check if a specified event type is active or not
		 */
		public function isEventActive(type : String) : Boolean
		{
			if(_listeners.hasOwnProperty(type) == true)
			{
				var i : int = _listeners[type]["length"];
				while(i--)
				{
					if(_listeners[type][i]["active"])
					{
						return true;
					}
				}
			}
			else
			{
				return true;
			}
			return false;
		}

		/**
		 * Add the event to the list
		 */
		public function addToList(type : String, listener : Function, useCapture : Boolean = false, active : Boolean = true) : void 
		{
			if(_allowAddToList == false) return;
			
			if(_listeners.hasOwnProperty(type) == false)
			{
				_listeners[type] = [];
			}
			_listeners[type]["push"]({ listener:listener, useCapture:useCapture, active:active });
		}

		/**
		 * Remove the event of the list
		 */
		public function removeFromList(type : String, listener : Function, useCapture : Boolean = false) : void 
		{
			if(_allowRemoveFromList == false) return;
			
			if(_listeners.hasOwnProperty(type) == true)
			{
				var i : int = _listeners[type]["length"];
				while(i--)
				{
					if(_listeners[type][i]["listener"] == listener && _listeners[type][i]["useCapture"] == useCapture)
					{
						_listeners[type]["splice"](i, 1);
					}
				}
			}
			
			emptyType(type);
		}
		
		public function dispose() : void
		{
			removeEvents();
			
			_item = null;
			_listeners = null;
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		
		/**
		 * @private
		 */
		private function emptyType(type : String) : void
		{
			if(_listeners.hasOwnProperty(type) == false) return;
			
			if(_listeners[type]["length"] == 0)
			{
				_listeners[type] = null;
				delete _listeners[type];
			}
		}
	}
}