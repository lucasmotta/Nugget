package fashion.nugget.media.sound
{

	import fashion.nugget.core.ISoundController;
	import fashion.nugget.core.ISoundItem;
	import fashion.nugget.core.ISoundLibrary;
	import fashion.nugget.events.SoundEvent;

	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.utils.Dictionary;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class SoundLibrary extends EventDispatcher implements ISoundLibrary
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _sounds : Dictionary;
		
		protected var _muted : Boolean;
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
			var soundItem : ISoundController = sound is Sound ? new SoundItem(sound) : sound;
			if(_muted) soundItem.mute();
			_sounds[id] = soundItem;
		}
		
		/**
		 * Removes the sound from the library
		 * 
		 * @param id			Sound identifier
		 */
		public function remove(id : String) : void
		{
			var sound : ISoundController = get(id);
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
		public function get(id : String) : ISoundController
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
			ISoundItem(get(id)).queue(autoPlay);
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
		 */
		public function stop(id : String) : void
		{
			get(id).stop();
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
			var sound : ISoundController;
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
		public function stopAll() : void
		{
			var sound : ISoundController;
			for each(sound in _sounds)
			{
				sound.stop();
			}
		}
		
		/**
		 * Pause all sounds
		 */
		public function pauseAll() : void
		{
			var sound : ISoundController;
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
			if(_muted) return;
			_muted = true;
			
			var sound : ISoundController;
			for each(sound in _sounds)
			{
				sound.mute();
			}
			this.dispatchEvent(new SoundEvent(SoundEvent.MUTE_ALL));
		}
		
		/**
		 * Unmute all sounds
		 */
		public function unmuteAll() : void
		{
			if(!_muted) return;
			_muted = false;
			
			var sound : ISoundController;
			for each(sound in _sounds)
			{
				sound.unmute();
			}
			this.dispatchEvent(new SoundEvent(SoundEvent.UNMUTE_ALL));
		}
		
		/**
		 * Dispose all sounds
		 */
		public function dispose() : void
		{
			var sound : ISoundController;
			for each(sound in _sounds)
			{
				sound.dispose();
			}
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Return if the sounds are muted or not
		 */
		public function get muted() : Boolean
		{
			return _muted;
		}

	}
}
