package fashion.nugget.loader
{

	import fashion.nugget.core.ILoaderView;
	import fashion.nugget.core.INavigation;
	import fashion.nugget.core.ISectionView;
	import fashion.nugget.events.SectionEvent;
	import fashion.nugget.view.NuggetView;

	import com.greensock.events.LoaderEvent;

	import flash.display.DisplayObject;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class BasicLoader extends NuggetView implements ILoaderView
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _navigation : INavigation;
		
		
		protected var _dependencies : Dependencies;
		
		protected var _section : ISectionView;
		
		protected var _loadProgress : Number;
		
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function BasicLoader()
		{
			_loadProgress = 0;
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function loadStart() : void
		{
			_loadProgress = 0;
			
			if(_dependencies.hasDependencies)
			{
				_dependencies.queueLoader.addEventListener(LoaderEvent.COMPLETE, onLoadComplete);
				_dependencies.queueLoader.addEventListener(LoaderEvent.PROGRESS, onLoadProgress);
				_dependencies.queueLoader.load();
			}
			else
			{
				onLoadProgress(null);
				onLoadComplete(null);
			}
		}
		
		protected function loadComplete() : void
		{
			_section = _dependencies.section;
			_section.nugget = this.nugget;
			_section.addEventListener(SectionEvent.CLOSED, onSectionClosed);
			addChild(_section as DisplayObject);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onLoadComplete(e : LoaderEvent) : void
		{
			loadComplete();
		}
		
		protected function onLoadProgress(e : LoaderEvent) : void
		{
			this.loadProgress = _dependencies.hasDependencies ? _dependencies.queueLoader.progress : 1;
		}
		
		protected function onSectionClosed(e : SectionEvent) : void
		{
			_section = null;
			if(_dependencies != null)
			{
				loadStart();
			}
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Start the loader
		 * 
		 * @param dependencies			Dependencies to load (including the own section)
		 */
		public function load(dependencies : Dependencies) : void
		{
			if(_dependencies)
			{
				_dependencies.dispose();
				_dependencies = null;
			}
			_dependencies = dependencies;
			_section != null ? _section.transitionOut() : loadStart();
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function set loadProgress(value : Number) : void
		{
			_loadProgress = value;
		}
		
		public function get loadProgress() : Number
		{
			return _loadProgress;
		}
		
		public function get navigation() : INavigation
		{
			return _navigation;
		}

		public function set navigation(value : INavigation) : void
		{
			_navigation = value;
		}
		
		public function get dependencies() : Dependencies
		{
			return _dependencies;
		}
	}
}
