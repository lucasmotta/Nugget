package fashion.nugget.abstract
{
	import flash.events.MouseEvent;
	import fashion.nugget.display.SpriteExtended;
	
	/**
	 * @author Lucas Motta
	 * 
	 * Base for a dragabble display object
	 */
	public class AbstractDrag extends SpriteExtended
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _dragging : Boolean;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function AbstractDrag()
		{
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS	
		// ----------------------------------------------------
		override protected function init() : void
		{
			addEventListener(MouseEvent.MOUSE_DOWN, onStartDrag);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onStartDrag(e : MouseEvent) : void
		{
			_dragging = true;
			
			onUpdateDrag(null);
			
			stage.addEventListener(MouseEvent.MOUSE_UP, onStopDrag);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onUpdateDrag);
		}
		
		protected function onStopDrag(e : MouseEvent) : void
		{
			_dragging = false;
			
			stage.removeEventListener(MouseEvent.MOUSE_UP, onStopDrag);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onUpdateDrag);
		}

		protected function onUpdateDrag(e : MouseEvent) : void
		{
			
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		

	}
}
