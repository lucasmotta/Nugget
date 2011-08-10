package fashion.nugget.view
{

	import fashion.nugget.Nugget;
	import fashion.nugget.core.INuggetView;
	import fashion.nugget.core.IViewLibrary;

	import flash.display.DisplayObject;
	import flash.utils.Dictionary;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * Library of views
	 */
	public class ViewLibrary implements IViewLibrary
	{

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _nugget : Nugget;
		
		protected var _views : Dictionary;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function ViewLibrary(nugget : Nugget)
		{
			_nugget = nugget;
			_views = new Dictionary();
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
		/**
		 * Add a new instance NuggetView to the library
		 */
		public function add(id : String, view : INuggetView) : void
		{
			_views[id] = view;
			
			view.nugget = _nugget;
			_nugget.container.addChild(view as DisplayObject);
		}

		/**
		 * Get a view from the library
		 */
		public function get(id : String) : INuggetView
		{
			return _views.hasOwnProperty(id) ? _views[id] : null;
		}
		
		/**
		 * Remove a view from the library
		 */
		public function remove(id : String) : void
		{
			var view : INuggetView = get(id);
			if(view)
			{
				view.dispose();
				_views[id] = null;
				delete _views[id];
			}
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
