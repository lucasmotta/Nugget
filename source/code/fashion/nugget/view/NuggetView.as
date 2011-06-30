package fashion.nugget.view
{

	import fashion.nugget.core.INugget;
	import fashion.nugget.core.INuggetView;


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * The view class extended with the nugget application. Where you can access other views, navigation, loader, sound controller, etc...
	 */
	public class NuggetView extends View implements INuggetView
	{
		
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
