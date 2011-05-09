package fashion.nugget.media.sound
{

	import fashion.nugget.core.ISoundItem;
	import fashion.nugget.core.ISoundLibrary;

	import flash.media.Sound;
	import flash.utils.Dictionary;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class SoundLibrary implements ISoundLibrary
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _sounds : Dictionary;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		private static var _instance : ISoundLibrary;
		
		public function SoundLibrary()
		{
			_sounds = new Dictionary();
		}
		
		public static function getInstance() : ISoundLibrary
		{
			if(_instance == null)
			{
				_instance = new SoundLibrary();
			}
			return _instance;
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Add a new sound to the library
		 * 
		 * @param id			Sound identifier
		 * @param sound			You can add a Sound or an ISoudItem to the library
		 */
		public function add(id : String, sound : *) : void
		{
			_sounds[id] = sound is Sound ? new SoundItem(sound) : sound;
		}
		
		/**
		 * Removes the sound from the library
		 * 
		 * @param id			Sound identifier
		 */
		public function remove(id : String) : void
		{
			var sound : ISoundItem = get(id);
			if(sound)
			{
				sound.dispose();
				sound = null;
			}
			delete _sounds[id];
		}
		
		/**
		 * Return an ISoundItem object
		 * 
		 * @param id			Sound identifier
		 */
		public function get(id : String) : ISoundItem
		{
			return _sounds.hasOwnProperty(id) ? _sounds[id] : null;
		}
		
		/**
		 * Play a specified sound
		 * 
		 * @param id			Sound identifier
		 */
		public function play(id : String) : void
		{
			get(id).play();
		}
		
		/**
		 * Queue a specified sound
		 * 
		 * @param id			Sound identifier
		 * @param autoPlay		Boolean value to set if the sound is going to start as soon as the method is called
		 */
		public function queue(id : String, autoPlay : Boolean = false) : void
		{
			get(id).queue(autoPlay);
		}
		
		/**
		 * Pause a specified sound
		 * 
		 * @param id			Sound identifier
		 */
		public function pause(id : String) : void
		{
			get(id).pause();
		}
		
		/**
		 * Stop a specified sound
		 * 
		 * @param id			Sound identifier
		 * @param clearQueue	Boolean value to clear the sound queue or not
		 */
		public function stop(id : String, clearQueue : Boolean = true) : void
		{
			get(id).stop(clearQueue);
		}
		
		/**
		 * Mute a specified sound
		 * 
		 * @param id			Sound identifier
		 */
		public function mute(id : String) : void
		{
			get(id).mute();
		}
		
		/**
		 * Unmute a specified sound
		 * 
		 * @param id			Sound identifier
		 */
		public function unmute(id : String) : void
		{
			get(id).unmute();
		}
		
		/**
		 * Play all sounds
		 */
		public function playAll() : void
		{
			var sound : ISoundItem;
			for each(sound in _sounds)
			{
				sound.play();
			}
		}
	
		/**
		 * Stop all sounds
		 * 
		 * @param clearQueue	Boolean value to clear the sound queue off all items or not
		 */
		public function stopAll(clearQueue : Boolean = false) : void
		{
			var sound : ISoundItem;
			for each(sound in _sounds)
			{
				sound.stop(clearQueue);
			}
		}
		
		/**
		 * Pause all sounds
		 */
		public function pauseAll() : void
		{
			var sound : ISoundItem;
			for each(sound in _sounds)
			{
				sound.pause();
			}
		}
		
		/**
		 * Mute all sounds
		 */
		public function muteAll() : void
		{
			var sound : ISoundItem;
			for each(sound in _sounds)
			{
				sound.mute();
			}
		}
		
		/**
		 * Unmute all sounds
		 */
		public function unmuteAll() : void
		{
			var sound : ISoundItem;
			for each(sound in _sounds)
			{
				sound.unmute();
			}
		}
		
		/**
		 * Dispose all sounds
		 */
		public function dispose() : void
		{
			var sound : ISoundItem;
			for each(sound in _sounds)
			{
				sound.dispose();
			}
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------

	}
}
