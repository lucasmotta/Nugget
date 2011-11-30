package fashion.nugget.abstract
{

	import fashion.nugget.Nugget;
	import fashion.nugget.core.IAbstractApp;
	import fashion.nugget.core.INavigation;
	import fashion.nugget.core.INugget;
	import fashion.nugget.data.Settings;
	import fashion.nugget.events.NuggetEvent;
	import fashion.nugget.loader.BasicLoader;
	import fashion.nugget.nav.BasicNavigation;
	import fashion.nugget.view.View;

	/**
	 * @author Lucas Motta
	 */
	public class AbstractApp extends View implements IAbstractApp
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private var _settings : Settings;
		
		protected var _app : INugget;
		
		protected var _id : String;
		
		
		protected var _navigation : INavigation;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function AbstractApp(id : String = null)
		{
			_id = id || "main";
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS	
		// ----------------------------------------------------
		override protected function init() : void
		{
			_app = new Nugget(_id, this);
			_app.loader = new BasicLoader();
			_app.settings = _settings;
			_app.navigation = _navigation;
			_app.addEventListener(NuggetEvent.READY, onAppReady);
			_app.init();
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onAppReady(e : NuggetEvent) : void
		{
			
		}
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function dispose() : void
		{
			if(_app)
			{
				_app.dispose();
				_app = null;
			}
			super.dispose();
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function set settings(value : Settings) : void
		{
			_settings = value;
		}
		
		public function set navigationXML(value : XML) : void
		{
			_navigation = new BasicNavigation(value);
		}
	}
}
