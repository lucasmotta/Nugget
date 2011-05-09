package fashion.nugget.view
{

	import fashion.nugget.core.IView;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class View extends Sprite implements IView
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _ready : Boolean;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function View()
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
		private function onAddedToStage(e : Event) : void
		{
			_ready = true;
			
			init();
			
			stage.addEventListener(Event.RESIZE, onStageResize);
		}
		
		private function onStageResize(e : Event) : void
		{
			resize();
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function resize() : void
		{
		}
		
		public function bringToFront() : void
		{
			if(this.parent != null)
			{
				if(this.parent.contains(this)) this.parent.addChild(this);
			}
		}
		
		public function sendToBack() : void
		{
			if(this.parent != null)
			{
				if(this.parent.contains(this)) this.parent.addChildAt(this, 0);
			}
		}
		
		public function dispose() : void
		{
			if(this.ready)
			{
				stage.removeEventListener(Event.RESIZE, onStageResize);
			}
			if(this.parent != null)
			{
				if(this.parent.contains(this)) this.parent.removeChild(this);
			}
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Returns if this view was added to the stage and it was initialized
		 */
		public function get ready() : Boolean
		{
			return _ready;
		}
	}
}
