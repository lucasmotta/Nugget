package fashion.nugget.events
{

	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class NuggetEvent extends Event
	{
		// ----------------------------------------------------
		// PUBLIC STATIC CONSTANTS
		// ----------------------------------------------------
		public static const STAGE_READY : String = "stageReady";
		
		public static const SETTINGS_READY : String = "settingsReady";
		
		public static const NAVIGATION_READY : String = "navigationReady";
		
		public static const READY : String = "ready";
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function NuggetEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
