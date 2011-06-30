package fashion.nugget.events
{

	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class NavigationEvent extends Event
	{
		
		// ----------------------------------------------------
		// PUBLIC STATIC CONSTANTS
		// ----------------------------------------------------
		public static const CHANGE : String = "NavigationEvent:CHANGE";
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _id : String;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function NavigationEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false, id : String = null)
		{
			_id = id;
			
			super(type, bubbles, cancelable);
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get id() : String
		{
			return _id;
		}
	}
}
