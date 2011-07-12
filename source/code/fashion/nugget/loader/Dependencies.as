package fashion.nugget.loader
{


	import fashion.nugget.core.IDependencies;
	import fashion.nugget.core.ISectionView;

	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.core.DisplayObjectLoader;
	import com.greensock.loading.core.LoaderCore;
	import com.greensock.loading.core.LoaderItem;

	import flash.utils.getDefinitionByName;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class Dependencies implements IDependencies
	{

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _xml : XML;

		protected var _queueLoader : LoaderMax;

		protected var _section : ISectionView;

		protected var _hasDependencies : Boolean;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Dependencies(xml : XML)
		{
			_xml = xml;
			_queueLoader = new LoaderMax();

			setupSection();
			setupDependencies();
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function setupSection() : void
		{
			var item : LoaderItem;
			var itemXML : XML;
			var sectionClass : Class;

			if (_xml.hasOwnProperty("file"))
			{
				itemXML = new XML(_xml.child("file"));
				item = new SWFLoader(itemXML.toString(), getLoaderParameters(itemXML));
				item.addEventListener(LoaderEvent.COMPLETE, onSectionLoadComplete);

				_hasDependencies = true;
				_queueLoader.append(item);
			}
			else
			{
				sectionClass = getDefinitionByName(_xml.child("view")) as Class;
				_section = new sectionClass() as ISectionView;
			}
		}

		protected function setupDependencies() : void
		{
			var i : int;
			const list : XMLList = _xml.child("dependencies").child("dependency");
			const length : int = list.length();
			
			if (length <= 0) return;

			for (i = 0; i < length; i++)
			{
				_queueLoader.prepend(LoaderMax.parse(String(list[i]), getLoaderParameters(list[i])));
			}

			_hasDependencies = true;
		}

		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onSectionLoadComplete(e : LoaderEvent) : void
		{
			_section = SWFLoader(e.target).rawContent as ISectionView;
		}

		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function dispose() : void
		{
			if (_queueLoader)
			{
				_queueLoader.dispose();
			}
		}

		public function get(id : String) : *
		{
			var loader : LoaderItem = _queueLoader.getLoader(id);
			if (loader is DisplayObjectLoader)
			{
				return DisplayObjectLoader(loader).rawContent;
			}
			return loader.content;
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get queueLoader() : LoaderCore
		{
			return _queueLoader;
		}

		public function get section() : ISectionView
		{
			return _section;
		}

		public function get hasDependencies() : Boolean
		{
			return _hasDependencies;
		}
	}
}
