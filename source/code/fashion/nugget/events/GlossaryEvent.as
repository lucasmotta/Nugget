package fashion.nugget.events
{

	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class GlossaryEvent extends Event
	{
		
		// ----------------------------------------------------
		// PUBLIC STATIC CONSTANTS
		// ----------------------------------------------------
		public static const LANGUAGE_CHANGE : String = "GlossaryEvent:LANGUAGE_CHANGE";
		
		public static const TEXT_CHANGE : String = "GlossaryEvent:TEXT_CHANGE";
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function GlossaryEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
