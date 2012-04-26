package fashion.nugget.abstract
{
	import fashion.nugget.util.string.printf;
	import fashion.nugget.Nugget;
	import fashion.nugget.core.IAbstractApp;
	import fashion.nugget.data.Settings;
	import fashion.nugget.i18n.Glossary;
	import fashion.nugget.util.toBoolean;
	import fashion.nugget.view.View;

	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.XMLLoader;

	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	
	public class AbstractAppLoader extends View
	{

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private var _glossary : Glossary;
		
		private var _settingsLoader : URLLoader;
		
		private var _settings : Settings;
		
		
		
		protected var _loader : LoaderMax;
		
		protected var _main : IAbstractApp;
		
		protected var _basepath : String;

		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function AbstractAppLoader()
		{
			LoaderMax.activate([XMLLoader, SWFLoader]);
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		/**
		 * If overriden, you <strong>must</strong> call the super
		 */
		override protected function init() : void
		{
			Nugget.basepath = root.loaderInfo.parameters["basepath"] || "";
			
			setupSettings();
		}
		
		private function setupSettings() : void
		{
			_settingsLoader = new URLLoader();
			_settingsLoader.addEventListener(Event.COMPLETE, onSettingsLoaded);
			_settingsLoader.load(new URLRequest(Nugget.basepath + "/assets/xml/settings.xml"));
		}
		
		/**
		 * If overriden, you <strong>must</strong> call the super
		 */
		protected function setupLoader() : void
		{
			_loader = new LoaderMax();
			_loader.maxConnections = 1;
			
			
			_loader.append(_glossary.currentLocale.queue);
			_loader.append(new XMLLoader(printf(_settings.xml.child("base").child("navigation").@url, { basepath:Nugget.basepath }), { name:"xml_navigation" }));
			_loader.append(new SWFLoader(printf(_settings.xml.child("base").child("swf").@url, { basepath:Nugget.basepath }), { name:"swf_main" }));

			_loader.addEventListener(LoaderEvent.OPEN, onLoadStarted);
			_loader.addEventListener(LoaderEvent.PROGRESS, onLoadProgress);
			_loader.addEventListener(LoaderEvent.COMPLETE, onLoadCompleted);
			_loader.load();
		}
		
		private function setupGlossary() : void
		{
			_glossary = Glossary.instance;
			_glossary.base = _settings.xml.child("data").child("xml");
			
			var i : int;
			var list : XMLList = _settings.xml.child("languages").child("language");
			var length : int = list.length();
			
			for(i = 0; i < length; i++)
			{
				_glossary.create(list[i]);
				if(toBoolean(list[i].@default)) _glossary.language = list[i];
			}
		}
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onLoadStarted(e : LoaderEvent) : void
		{
			
		}
		
		protected function onLoadProgress(e : LoaderEvent) : void
		{
			
		}
		
		/**
		 * If overriden, you <strong>must</strong> call the super
		 */
		protected function onLoadCompleted(e : LoaderEvent) : void
		{
			_main = _loader.getContent("swf_main")["rawContent"];
			_main.navigationXML = _loader.getContent("xml_navigation");
			_main.settings = _settings;
			addChild(_main as DisplayObject);
		}
		
		private function onSettingsLoaded(e : Event) : void
		{
			_settingsLoader.removeEventListener(Event.COMPLETE, onSettingsLoaded);
			_settings = new Settings(new XML(_settingsLoader.data), stage);
			
			setupGlossary();
			setupLoader();
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
