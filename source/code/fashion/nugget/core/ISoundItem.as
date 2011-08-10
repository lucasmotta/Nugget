package fashion.nugget.core
{

	import flash.media.Sound;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ISoundItem extends IDisposable
	{
		
		/**
		 * Play the sound
		 */
		function play() : void
		
		/**
		 * Queue the sound
		 * 
		 * @param autoPlay		Boolean value to set if the sound is going to start as soon as the method is called or not
		 */
		function queue(autoPlay : Boolean = false) : void
		
		/**
		 * Pause the sound
		 */
		function pause() : void
		
		/**
		 * Stop the sound
		 * 
		 * @param clearQueue	Boolean value to clear the sound queue or not
		 */
		function stop(clearQueue : Boolean = true) : void
		
		/**
		 * Mute the sound
		 */
		function mute() : void
		
		/**
		 * Unmute the sound
		 */
		function unmute() : void
		
		
		/**
		 * Sound instance
		 */
		function set sound(value : Sound) : void
		
		function get sound() : Sound
		
		/**
		 * Return if the sound is playing or not
		 */
		function get playing() : Boolean
		
		/**
		 * Get the sound duration in milliseconds
		 */
		function get duration() : Number
		
		/**
		 * Get the current time
		 */
		function get time() : Number
	}
}
