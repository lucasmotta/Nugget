package fashion.nugget.view
{

	import fashion.nugget.util.display.safeRemoveChild;
	import fashion.nugget.core.IView;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * Simple view with some basic features, like:
	 * – Check when the view is added to stage;
	 * – Resize method;
	 * – Bring to front / Send to back methods
	 */
	public class View extends Sprite implements IView
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
		protected function onAddedToStage(e : Event) : void
		{
			init();
			resize();
			
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.addEventListener(Event.RESIZE, onStageResize);
		}
		
		protected function onStageResize(e : Event) : void
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
			if(_disposed) return;
			_disposed = true;
			
			if(this.ready)
			{
				stage.removeEventListener(Event.RESIZE, onStageResize);
			}
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			safeRemoveChild(this);
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Returns if this view was added to the stage and it was initialized
		 */
		public function get ready() : Boolean
		{
			return this.stage != null;
		}
	}
}
