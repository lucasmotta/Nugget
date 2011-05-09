package fashion.nugget.events
{

	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class SectionEvent extends Event
	{
		
		public static const CLOSED : String = "closed";
		
		public function SectionEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
