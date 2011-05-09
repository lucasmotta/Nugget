package fashion.nugget.core
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ISoundLibrary extends IDisposable
	{
		
		function add(id : String, sound : *) : void
		
		function remove(id : String) : void
		
		function get(id : String) : ISoundItem
		
		
		function play(id : String) : void
		
		function queue(id : String, autoPlay : Boolean = false) : void
		
		function pause(id : String) : void
		
		function stop(id : String, clearQueue : Boolean = true) : void
		
		function mute(id : String) : void
		
		function unmute(id : String) : void
		
		
		function playAll() : void
		
		function stopAll(clearQueue : Boolean = true) : void
		
		function pauseAll() : void
		
		function muteAll() : void
		
		function unmuteAll() : void
	}
}
