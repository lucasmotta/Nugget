package fashion.nugget.core
{

	import flash.media.Sound;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ISoundItem extends IDisposable
	{
		
		function play() : void
		
		function queue(autoPlay : Boolean = false) : void
		
		function pause() : void
		
		function stop(clearQueue : Boolean = true) : void
		
		function mute() : void
		
		function unmute() : void
		
		
		function set sound(value : Sound) : void
		
		function get sound() : Sound
		
		function get playing() : Boolean
		
		function get duration() : Number
		
		function get time() : Number
	}
}
