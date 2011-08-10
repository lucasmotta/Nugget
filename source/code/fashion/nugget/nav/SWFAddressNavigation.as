package fashion.nugget.nav
{

	import fashion.nugget.events.NavigationEvent;
	import fashion.nugget.loader.Dependencies;

	import com.asual.swfaddress.SWFAddress;

	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class SWFAddressNavigation extends BasicNavigation
	{

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _level : int;

		protected var _watcher : SWFAddressWatcher;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function SWFAddressNavigation(xml : XML = null, level : int = 0)
		{
			_level = level;

			super(xml);
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------

		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		override public function init() : void
		{
			_watcher = new SWFAddressWatcher(_level, SWFAddressWatcher.TYPE_PATH);
			_watcher.addEventListener(Event.CHANGE, onSWFAddressChange);
			_watcher.value == null ? toDefault() : onSWFAddressChange();
		}
		
		protected function onSWFAddressChange(e : Event = null) : void
		{
			var child : XMLList = _xml.child("section").(@id == _watcher.value);

			if (child.length() > 0)
			{
				if (_id == _watcher.value) return;
				_lastId = _id;
				_id = _watcher.value;
				this.nugget.loader.load(new Dependencies(new XML(_xml.child("section").(@id == _id))));
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE, false, false, _id));
			}
		}

		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function to(id : String) : void
		{
			var array : Array = SWFAddress.getPathNames() || [];
			array.length = Math.min(array.length, _level);
			array.push(id);
			
			SWFAddress.setValue(array.join("/"));
		}
		
		override public function dispose() : void
		{
			if(_watcher)
			{
				_watcher.dispose();
				_watcher.removeEventListener(Event.CHANGE, onSWFAddressChange);
				_watcher = null;
			}
			super.dispose();
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
