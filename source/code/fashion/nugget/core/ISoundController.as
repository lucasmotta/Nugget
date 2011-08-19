package fashion.nugget.core
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ISoundController extends IDisposable
	{
		
		/**
		 * Play the sound
		 */
		function play() : void
		
		/**
		 * Pause the sound
		 */
		function pause() : void
		
		/**
		 * Stop the sound
		 */
		function stop() : void
		
		/**
		 * Mute the sound
		 */
		function mute() : void
		
		/**
		 * Unmute the sound
		 */
		function unmute() : void
	}
}
