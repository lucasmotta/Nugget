package fashion.nugget.nav
{

	import fashion.nugget.core.ILoaderView;
	import fashion.nugget.core.INavigation;
	import fashion.nugget.core.INugget;
	import fashion.nugget.events.NuggetEvent;
	import fashion.nugget.loader.Dependencies;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class BasicNavigation extends EventDispatcher implements INavigation
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private var _loader : ILoaderView;
		
		private var _nugget : INugget;
		
		
		protected var _xml : XML;
		
		protected var _url : String;
		
		protected var _xmlLoader : URLLoader;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 * 
		 * @param value				Either an URL for the XML or the XML itself
		 */
		public function BasicNavigation(value : *)
		{
			if(value is String)
			{
				_url = value;
			}
			else if(value is XML)
			{
				_xml = value;
			}
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		private function onLoadComplete(e : Event) : void
		{
			_xml = new XML(_xmlLoader.data);
			
			dispatchEvent(new NuggetEvent(NuggetEvent.NAVIGATION_READY));
		}
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Navigate to a specific section
		 */
		public function to(id : String) : void
		{
			_loader.load(new Dependencies(new XML(_xml.child("section").(@id == id))));
		}
		
		public function dispose() : void
		{
			if(_xmlLoader)
			{
				_xmlLoader.removeEventListener(Event.COMPLETE, onLoadComplete);
				_xmlLoader = null;
			}
		}
		
		public function load() : void
		{
			if(_xml != null)
			{
				dispatchEvent(new NuggetEvent(NuggetEvent.NAVIGATION_READY));
				return;
			}
			//
			_xmlLoader = new URLLoader();
			_xmlLoader.addEventListener(Event.COMPLETE, onLoadComplete);
			_xmlLoader.load(new URLRequest(_url));
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get xml() : XML
		{
			return _xml;
		}
		
		public function get loader() : ILoaderView
		{
			return _loader;
		}

		public function set loader(value : ILoaderView) : void
		{
			_loader = value;
		}
		
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
