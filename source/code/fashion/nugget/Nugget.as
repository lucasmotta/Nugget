package fashion.nugget
{

	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.VideoLoader;
	import com.greensock.loading.XMLLoader;
	import fashion.nugget.core.ILoaderView;
	import fashion.nugget.core.INavigation;
	import fashion.nugget.core.INugget;
	import fashion.nugget.core.ISoundLibrary;
	import fashion.nugget.core.IViewLibrary;
	import fashion.nugget.data.Parameters;
	import fashion.nugget.data.Settings;
	import fashion.nugget.events.NuggetEvent;
	import fashion.nugget.media.sound.SoundLibrary;
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
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _id : String;
		
		protected var _container : DisplayObjectContainer;
		
		
		protected var _stage : Stage;
		
		protected var _stageReady : Boolean;
		
		
		protected var _settings : Settings;
		
		protected var _settingsReady : Boolean;
		
		
		protected var _parameters : Parameters;
		
		
		protected var _loader : ILoaderView;
		
		
		protected var _navigation : INavigation;
		
		protected var _navigationReady : Boolean;
		
		
		protected var _views : IViewLibrary;
		
		protected var _soundLibrary : ISoundLibrary;
		
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
			_parameters = Parameters.getInstance();
			
			LoaderMax.activate([SWFLoader, XMLLoader, ImageLoader, VideoLoader]);
			NuggetLibrary.add(id, this);
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function ready() : void
		{
			if(_settings)
			{
				_settings.apply(this);
			}
			//
			dispatchEvent(new NuggetEvent(NuggetEvent.READY));
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onStageReady(e : Event) : void
		{
			_stage = _container.stage;
			_stageReady = true;
			
			_container.removeEventListener(Event.ADDED_TO_STAGE, onStageReady);
			
			dispatchEvent(new NuggetEvent(NuggetEvent.STAGE_READY));
			
			_navigation.load();
		}
		
		protected function onNavigationReady(e : NuggetEvent) : void
		{
			_navigationReady = true;
			
			dispatchEvent(e.clone());
			
			_settings == null ? ready() : _settings.load();
		}
		
		protected function onSettingsReady(e : NuggetEvent) : void
		{
			_settingsReady = true;
			
			dispatchEvent(e.clone());
			
			ready();
		}
		
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function init() : void
		{
			_loader.nugget = this;
			_loader.navigation = _navigation;
			
			_navigation.nugget = this;
			_navigation.loader = _loader;
			
			_stage = _container.stage;
			_stage == null ? _container.addEventListener(Event.ADDED_TO_STAGE, onStageReady) : onStageReady(null);
		}
		
		public function dispose() : void
		{
			if(_loader)
			{
				_loader.dispose();
			}
			if(_navigation)
			{
				_navigation.dispose();
				_navigation.removeEventListener(NuggetEvent.NAVIGATION_READY, onNavigationReady);
			}
			NuggetLibrary.remove(_id);			
		}
			
		override public function toString() : String
		{
			return "[Nugget id=" + _id + " container=" + _container + "]";
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
			_settings.addEventListener(NuggetEvent.SETTINGS_READY, onSettingsReady);
		}
		
		public function get settings() : Settings
		{
			return _settings;
		}
		
		/**
		 * Return if the settings are ready or not
		 */
		public function get settingsReady() : Boolean
		{
			return _settingsReady;
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
			_container.addChild(_loader as DisplayObject);
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
			_navigation.addEventListener(NuggetEvent.NAVIGATION_READY, onNavigationReady);
		}
		
		/**
		 * Return if the navigation is ready or not
		 */
		public function get navigationReady() : Boolean
		{
			return _navigationReady;
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
		 * Return if the stage is ready or not
		 */
		public function get stageReady() : Boolean
		{
			return _stageReady;
		}
		
	}
}
