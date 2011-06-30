package fashion.nugget.events
{

	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class SectionEvent extends Event
	{
		
		
		// ----------------------------------------------------
		// PUBLIC STATIC CONSTANTS
		// ----------------------------------------------------
		public static const CLOSED : String = "SectionEvent:CLOSED";
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function SectionEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
