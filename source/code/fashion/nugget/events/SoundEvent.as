package fashion.nugget.events
{

	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class SoundEvent extends Event
	{
		
		public static const SOUND_COMPLETE : String = "soundComplete";
		
		public static const SOUND_START : String = "soundStart";
		
		public function SoundEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
