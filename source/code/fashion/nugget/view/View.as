package fashion.nugget.view
{

	import fashion.nugget.core.IView;
	import fashion.nugget.display.SpriteExtended;

	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * Simple view with some basic features, like:
	 * – Check when the view is added to stage;
	 * – Resize method;
	 * – Bring to front / Send to back methods
	 */
	public class View extends SpriteExtended implements IView
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function View()
		{
			
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		override protected function onAddedToStage(e : Event) : void
		{
			super.onAddedToStage(e);
			
			resize();
			
			stage.addEventListener(Event.RESIZE, onStageResize);
		}
		
		protected function onStageResize(e : Event) : void
		{
			resize();
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Method called when the stage is resized
		 */
		public function resize() : void
		{
		}
		
		/**
		 * Bring the view to the front
		 */
		public function bringToFront() : void
		{
			if(this.parent != null)
			{
				if(this.parent.contains(this)) this.parent.setChildIndex(this, this.parent.numChildren - 1);
			}
		}
		
		/**
		 * Send the view back
		 */
		public function sendToBack() : void
		{
			if(this.parent != null)
			{
				if(this.parent.contains(this)) this.parent.setChildIndex(this, 0);
			}
		}
		
		
		override public function dispose() : void
		{
			if(_disposed) return;
			
			if(this.ready)
			{
				stage.removeEventListener(Event.RESIZE, onStageResize);
			}
			super.dispose();
			
			_disposed = true;
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
