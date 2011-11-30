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
		public static const TRANSLATE_COMPLETED : String = "GlossaryEvent:TRANSLATE_COMPLETED";
		
		public static const LANGUAGE_CHANGE : String = "GlossaryEvent:LANGUAGE_CHANGE";
		
		public static const TEXT_CHANGE : String = "GlossaryEvent:TEXT_CHANGE";
		
		public static const LOAD_START : String = "GlossaryEvent:LOAD_START";
		
		public static const LOAD_COMPLETED : String = "GlossaryEvent:LOAD_COMPLETED";
		
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
