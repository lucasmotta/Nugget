package fashion.nugget.nav
{

	import fashion.nugget.core.IDisposable;

	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;

	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class SWFAddressWatcher extends EventDispatcher implements IDisposable
	{
		
		public static const TYPE_PATH : String = "path";
		
		public static const TYPE_PARAM : String = "param";
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _key : *;
		
		protected var _value : String;
		
		protected var _type : String; 
		
		protected var _blocked : Boolean;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function SWFAddressWatcher(key : *, type : String = null)
		{
			_key = key;
			_type = type || SWFAddressWatcher.TYPE_PATH;
			
			_blocked = true;
			onSWFAddressChange(null);
			_blocked = false;
			
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, onSWFAddressChange);
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function onSWFAddressChange(e : SWFAddressEvent) : void
		{
			if(_type == SWFAddressWatcher.TYPE_PATH)
			{
				var items : Array = SWFAddress.getPathNames();
				if(items[_key] != _value)
				{
					_value = items[_key];
					if(!_blocked) this.dispatchEvent(new Event(Event.CHANGE));
				}
			}
			else
			{
				var param : String = SWFAddress.getParameter(_key) as String;
				if(_value != param)
				{
					_value = param;
					if(!_blocked) this.dispatchEvent(new Event(Event.CHANGE));
				}
			}
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function dispose() : void
		{
			SWFAddress.removeEventListener(SWFAddressEvent.CHANGE, onSWFAddressChange);
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get value() : String
		{
			return _value;
		}
		
		public function set value(value : String) : void
		{
			_value = value;
		}
		
		public function set blocked(value : Boolean) : void
		{
			_blocked = value;
		}
		
		public function get blocked() : Boolean
		{
			return _blocked;
		}
	}
}
