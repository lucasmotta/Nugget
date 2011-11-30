package
{

	import fashion.nugget.display.GradientBox;
	import fashion.nugget.display.ScrollMouse;
	import fashion.nugget.view.View;

	import flash.display.StageScaleMode;

	/**
	 * @author Lucas Motta
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="60", width="1000", height="700")]
	public class ScrollMouseExample extends View
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _scroll : ScrollMouse;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function ScrollMouseExample()
		{
			super();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS	
		// ----------------------------------------------------
		override protected function init() : void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var box : GradientBox = new GradientBox(2000, 800, 0, [0xFF0000, 0xFFFF00, 0x00FF00, 0x00FFFF, 0x0000FF, 0xFF00FF, 0xFF0000]);
			box.addChild(new GradientBox(2000, 800, 90, [0, 0], null, [0, 1]));
			
			_scroll = new ScrollMouse(box, 640, 480, .05);
			_scroll.position(100, 100);
			addChild(_scroll);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		
	}
}
