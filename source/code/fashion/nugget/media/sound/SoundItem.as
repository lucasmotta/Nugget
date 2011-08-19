package fashion.nugget.media.sound
{

	import fashion.nugget.core.ISoundItem;
	import fashion.nugget.events.SoundEvent;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class SoundItem extends EventDispatcher implements ISoundItem
	{

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _sound : Sound;

		protected var _channel : SoundChannel;

		protected var _soundTransform : SoundTransform;

		protected var _playing : Boolean;

		protected var _muted : Boolean;

		protected var _pausePosition : Number;

		protected var _soundQueue : int;

		protected var _volume : Number;

		protected var _duration : Number;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 * 
		 * @param sound			Sound instance
		 * @param volume		Default volume for your sound
		 */
		public function SoundItem(sound : Sound = null, volume : Number = 1)
		{
			_playing = false;
			_muted = false;
			_pausePosition = 0;
			_soundQueue = 0;
			_volume = volume;
			_duration = 0;

			this.sound = sound;
			_soundTransform = new SoundTransform(_volume);
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function playSound(position : Number = 0) : void
		{
			if (_channel)
			{
				_channel.removeEventListener(Event.SOUND_COMPLETE, onSoundComplete);
			}
			_soundQueue--;
			_playing = true;
			_channel = _sound.play(position, 0, _soundTransform);
			_channel.addEventListener(Event.SOUND_COMPLETE, onSoundComplete);

			dispatchEvent(new SoundEvent(SoundEvent.SOUND_START));
		}

		protected function stopSound(recordPosition : Boolean = false) : void
		{
			_pausePosition = recordPosition ? _channel ? _channel.position : 0 : 0;
			if (_channel)
			{
				_channel.removeEventListener(Event.SOUND_COMPLETE, onSoundComplete);
				_channel.stop();
			}
		}

		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onSoundComplete(e : Event) : void
		{
			_playing = false;
			_pausePosition = 0;
			//
			if (_soundQueue > 0)
			{
				playSound();
			}
			else
			{
				dispatchEvent(new SoundEvent(SoundEvent.SOUND_COMPLETE));
			}
		}

		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Play the sound
		 */
		public function play() : void
		{
			if (_playing) return;
			if (_soundQueue == 0) _soundQueue++;
			playSound(_pausePosition);
		}

		/**
		 * Queue the sound
		 * 
		 * @param autoPlay		Boolean value to set if the sound is going to start as soon as the method is called or not
		 */
		public function queue(autoPlay : Boolean = false) : void
		{
			_soundQueue++;
			if (!_playing)
			{
				if (autoPlay) playSound();
			}
		}

		/**
		 * Pause the sound
		 */
		public function pause() : void
		{
			if (!_playing) return;
			stopSound(true);
		}

		/**
		 * Stop the sound
		 * 
		 * @param clearQueue	Boolean value to clear the sound queue or not
		 */
		public function stop() : void
		{
			_soundQueue = 0;
			if (!_playing) return;
			stopSound(false);
		}

		/**
		 * Mute the sound
		 */
		public function mute() : void
		{
			if (_muted) return;
			_muted = true;
			_soundTransform = new SoundTransform(0);
			if (_channel)
			{
				_channel.soundTransform = _soundTransform;
			}
		}

		/**
		 * Unmute the sound
		 */
		public function unmute() : void
		{
			if (!_muted) return;
			_muted = false;
			_soundTransform = new SoundTransform(_volume);
			if (_channel)
			{
				_channel.soundTransform = _soundTransform;
			}
		}

		/**
		 * Dispose
		 */
		public function dispose() : void
		{
			_soundQueue = 0;
			stopSound(false);
			_sound = null;
			_soundTransform = null;
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Sound instance
		 */
		public function get sound() : Sound
		{
			return _sound;
		}

		public function set sound(value : Sound) : void
		{
			_sound = value;
			if (_sound)
			{
				_duration = _sound.length;
			}
		}

		/**
		 * Return if the sound is playing or not
		 */
		public function get playing() : Boolean
		{
			return _playing;
		}

		/**
		 * Get the sound duration in milliseconds
		 */
		public function get duration() : Number
		{
			return _duration;
		}
		
		/**
		 * Get the current time
		 */
		public function get time() : Number
		{
			return _channel ? _channel.position : 0;
		}
	}
}
