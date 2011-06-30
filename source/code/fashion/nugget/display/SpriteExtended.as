package fashion.nugget.display
{

	import fashion.nugget.util.display.safeRemoveChild;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class SpriteExtended extends Sprite
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _disposed : Boolean;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function SpriteExtended()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function init() : void
		{
			
		}
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onAddedToStage(e : Event) : void
		{
			init();
			
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function dispose() : void
		{
			if(_disposed) return;
			_disposed = true;
			
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			safeRemoveChild(this);
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get ready() : Boolean
		{
			return this.stage != null;
		}
	}
}
