package fashion.nugget.display
{

	import fashion.nugget.util.display.safeRemoveChild;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * The SpriteExtended will call the <code>init</code> method when the displayObject is added to the stage.
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
		
		public function position(x : Number = undefined, y : Number = undefined) : SpriteExtended
		{
			if(Boolean(x)) this.x = x;
			if(Boolean(y)) this.y = y;
			return this;
		}
		
		public function size(width : Number = undefined, height : Number = undefined) : SpriteExtended
		{
			if(Boolean(width)) this.width = width;
			if(Boolean(height)) this.height = height;
			return this;
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Get if the stage is available or not
		 */
		public function get ready() : Boolean
		{
			return this.stage != null;
		}
	}
}
