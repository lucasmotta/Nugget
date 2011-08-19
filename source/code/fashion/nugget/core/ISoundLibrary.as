package fashion.nugget.core
{
	import flash.events.IEventDispatcher;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ISoundLibrary extends IDisposable, IEventDispatcher
	{
		
		/**
		 * Add a new sound to the library
		 * 
		 * @param id			Sound identifier
		 * @param sound			You can add a Sound or an ISoudItem to the library
		 */
		function add(id : String, sound : *) : void
		
		/**
		 * Removes the sound from the library
		 * 
		 * @param id			Sound identifier
		 */
		function remove(id : String) : void
		
		/**
		 * Return an ISoundItem object
		 * 
		 * @param id			Sound identifier
		 */
		function get(id : String) : ISoundController
		
		
		/**
		 * Play a specified sound
		 * 
		 * @param id			Sound identifier
		 */
		function play(id : String) : void
		
		/**
		 * Queue a specified sound
		 * 
		 * @param id			Sound identifier
		 * @param autoPlay		Boolean value to set if the sound is going to start as soon as the method is called
		 */
		function queue(id : String, autoPlay : Boolean = false) : void
		
		/**
		 * Pause a specified sound
		 * 
		 * @param id			Sound identifier
		 */
		function pause(id : String) : void
		
		/**
		 * Stop a specified sound
		 * 
		 * @param id			Sound identifier
		 */
		function stop(id : String) : void
		
		/**
		 * Mute a specified sound
		 * 
		 * @param id			Sound identifier
		 */
		function mute(id : String) : void
		
		/**
		 * Unmute a specified sound
		 * 
		 * @param id			Sound identifier
		 */
		function unmute(id : String) : void
		
		/**
		 * Play all sounds
		 */
		function playAll() : void
		
		/**
		 * Stop all sounds
		 */
		function stopAll() : void
		
		/**
		 * Pause all sounds
		 */
		function pauseAll() : void
		
		/**
		 * Mute all sounds
		 */
		function muteAll() : void
		
		/**
		 * Unmute all sounds
		 */
		function unmuteAll() : void
		
		
		/**
		 * Return if the sounds are muted or not
		 */
		function get muted() : Boolean
	}
}
