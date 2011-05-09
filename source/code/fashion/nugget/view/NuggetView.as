package fashion.nugget.view
{

	import fashion.nugget.core.INugget;
	import fashion.nugget.core.INuggetView;


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class NuggetView extends View implements INuggetView
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _nugget : INugget;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function NuggetView()
		{
			super();
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
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Nugget Application
		 */
		public function get nugget() : INugget
		{
			return _nugget;
		}

		public function set nugget(value : INugget) : void
		{
			_nugget = value;
		}
	}
}
