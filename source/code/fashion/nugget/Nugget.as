package fashion.nugget
{

	import fashion.nugget.util.validation.isEmpty;
	import fashion.nugget.util.string.printf;
	import fashion.nugget.core.ICursor;
	import fashion.nugget.core.ILoaderView;
	import fashion.nugget.core.INavigation;
	import fashion.nugget.core.INugget;
	import fashion.nugget.core.ISoundLibrary;
	import fashion.nugget.core.IViewLibrary;
	import fashion.nugget.data.Settings;
	import fashion.nugget.events.NuggetEvent;
	import fashion.nugget.media.sound.SoundLibrary;
	import fashion.nugget.util.display.safeRemoveChild;
	import fashion.nugget.view.ViewLibrary;

	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class Nugget extends EventDispatcher implements INugget
	{
		
		// ----------------------------------------------------
		// STATIC VARIABLES
		// ----------------------------------------------------
		private static var _basepath : String = ".";
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _id : String;
		
		protected var _container : DisplayObjectContainer;
		
		
		protected var _stage : Stage;
		
		protected var _settings : Settings;
		
		
		protected var _loader : ILoaderView;
		
		protected var _navigation : INavigation;
		
		protected var _views : IViewLibrary;
		
		protected var _soundLibrary : ISoundLibrary;
		
		protected var _cursor : ICursor;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Nugget(id : String, container : DisplayObjectContainer)
		{
			_id = id;
			_container = container;
			_views = new ViewLibrary(this);
			_soundLibrary = SoundLibrary.getInstance();
			
			NuggetLibrary.add(id, this);
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function ready() : void
		{
			_navigation.init();
			///
			dispatchEvent(new NuggetEvent(NuggetEvent.READY));
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onStageReady(e : Event) : void
		{
			_stage = _container.stage;
			
			_container.addChild(_loader as DisplayObject);
			_container.removeEventListener(Event.ADDED_TO_STAGE, onStageReady);
			
			ready();
		}
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Initialize the application
		 */
		public function init() : void
		{
			_loader.nugget = this;
			_navigation.nugget = this;
			_settings.nugget = this;
			
			_stage = _container.stage;
			_stage == null ? _container.addEventListener(Event.ADDED_TO_STAGE, onStageReady) : onStageReady(null);
		}
		
		/**
		 * Dispose the application
		 */
		public function dispose() : void
		{
			if(_loader)
			{
				_loader.dispose();
			}
			if(_navigation)
			{
				_navigation.dispose();
			}
			NuggetLibrary.remove(_id);			
		}
		
		/**
		 * Register sections so they can be available through the method <code>getDefinitionByName()</code>
		 * You don't have to use this method to register the section if you don't want to.
		 */
		public function registerSections(...sections) : void
		{
			
		}
		
		override public function toString() : String
		{
			return printf("[Nugget id=%(id)s container=%(container)s]", { id:_id, container:_container });
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Application Identification
		 */
		public function get id() : String
		{
			return _id;
		}
		
		/**
		 * Container
		 */
		public function get container() : DisplayObjectContainer
		{
			return _container;
		}
		
		/**
		 * Settings
		 */
		public function set settings(value : Settings) : void
		{
			_settings = value;
		}
		
		public function get settings() : Settings
		{
			return _settings;
		}
		
		/**
		 * A main loader view
		 */
		public function get loader() : ILoaderView
		{
			return _loader;
		}
		
		public function set loader(value : ILoaderView) : void
		{
			_loader = value;
		}
		
		/**
		 * Navigation
		 */
		public function get navigation() : INavigation
		{
			return _navigation;
		}
		
		public function set navigation(value : INavigation) : void
		{
			_navigation = value;
		}
		
		/**
		 * Views Library
		 */
		public function get views() : IViewLibrary
		{
			return _views;
		}
		
		/**
		 * Sound Library
		 */
		public function get soundLibrary() : ISoundLibrary
		{
			return _soundLibrary;
		}
		
		/**
		 * Stage
		 */
		public function get stage() : Stage
		{
			return _stage;
		}
		
		/**
		 * Custom cursor
		 */
		public function set cursor(value : ICursor) : void
		{
			if(_cursor)
			{
				_cursor.dispose();
				safeRemoveChild(_cursor as DisplayObject);
				_cursor = null;
			}
			_cursor = value;
			if(_cursor)
			{
				this.views.add("default-cursor", _cursor);
			}
		}
		
		public function get cursor() : ICursor
		{
			return _cursor;
		}
		
		// ----------------------------------------------------
		// STATIC GETTER AND SETTER
		// ----------------------------------------------------
		public static function get basepath() : String
		{
			return _basepath;
		}
		
		public static function set basepath(value : String) : void
		{
			if(value.length >= 1)
			{
				if(value.lastIndexOf("/") == value.length - 1) value = value.slice(0, value.length - 1);
			}
			if(isEmpty(value)) value = ".";
			_basepath = value;
		}
		
	}
}
