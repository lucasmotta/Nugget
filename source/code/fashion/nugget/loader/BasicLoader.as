package fashion.nugget.loader
{

	import fashion.nugget.core.IDependencies;
	import fashion.nugget.core.ILoaderView;
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
		protected var _dependencies : IDependencies;

		protected var _section : ISectionView;
		

		protected var _loadProgress : Number;
		
		protected var _waitLoader : Boolean;


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
			
			if(_dependencies == null)
			{
				return;
			}

			if (_dependencies.hasDependencies)
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
			_waitLoader ? _section.transitionOut() : addSection();
		}
		
		protected function addSection() : void
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
			_waitLoader ? addSection() : loadStart();
		}

		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Load the section and his dependencies
		 * 
		 * @param dependencies			Dependencies to load (including the own section)
		 */
		public function load(dependencies : IDependencies) : void
		{
			if (_dependencies)
			{
				_dependencies.dispose();
				_dependencies = null;
			}
			_dependencies = dependencies;
			_section == null || _waitLoader ? loadStart() : _section.transitionOut();
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * The dependencies load progress. Float number between 0 and 1.
		 */
		public function set loadProgress(value : Number) : void
		{
			_loadProgress = value;
		}

		public function get loadProgress() : Number
		{
			return _loadProgress;
		}
		
		/**
		 * Sets whether the current section will wait the new section load, before being removed from the stage.
		 * If you set the value as <code>false</code>, the current section will be removed and then the new section will start to load.
		 * But if you set as <code>true</code>, the new section will load instantly. And after the load finishes is that the current section will be removed.
		 */
		public function set waitLoader(value : Boolean) : void
		{
			_waitLoader = value;
		}
		
		public function get waitLoader() : Boolean
		{
			return _waitLoader;
		}
		
		/**
		 * Section dependencies
		 */
		public function get dependencies() : IDependencies
		{
			return _dependencies;
		}
	}
}
