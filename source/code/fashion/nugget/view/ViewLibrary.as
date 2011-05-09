package fashion.nugget.view
{

	import fashion.nugget.Nugget;
	import fashion.nugget.core.INuggetView;
	import fashion.nugget.core.IViewLibrary;

	import flash.display.DisplayObject;
	import flash.utils.Dictionary;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
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
		public function add(id : String, view : INuggetView) : void
		{
			view.nugget = _nugget;
			_nugget.container.addChild(view as DisplayObject);
			//
			_views[id] = view;
		}

		public function get(id : String) : INuggetView
		{
			return _views.hasOwnProperty(id) ? _views[id] : null;
		}

		public function remove(id : String) : void
		{
			var view : INuggetView = get(id);
			if(view)
			{
				view.dispose();
				delete _views[id];
			}
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
