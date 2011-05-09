package fashion.nugget.view
{

	import fashion.nugget.core.IDisposable;

	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.core.DisplayObjectLoader;
	import com.greensock.loading.core.LoaderCore;


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class LoadableView extends View implements IDisposable
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _url : String;
		
		protected var _type : String;
		
		protected var _loader : DisplayObjectLoader;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function LoadableView(url : String, type : String = null)
		{
			_url = url;
			_type = type;
			
			_loader = LoaderMax.parse(_url);
			_loader.addEventListener(LoaderEvent.OPEN, onLoadStart);
			_loader.addEventListener(LoaderEvent.PROGRESS, onLoadProgress);
			_loader.addEventListener(LoaderEvent.COMPLETE, onLoadComplete);
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function onLoadStart(e : LoaderEvent) : void
		{
		}

		protected function onLoadProgress(e : LoaderEvent) : void
		{
		}

		protected function onLoadComplete(e : LoaderEvent) : void
		{
		}
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function load() : void
		{
			_loader.load();
		}
		
		override public function dispose() : void
		{
			if(_loader)
			{
				_loader.dispose();
				_loader = null;
			}
			super.dispose();
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get url() : String
		{
			return _url;
		}
		
		public function get type() : String
		{
			return _type;
		}
		
		public function get loader() : LoaderCore
		{
			return _loader;
		}
	}
}
