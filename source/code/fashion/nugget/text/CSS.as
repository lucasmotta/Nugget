package fashion.nugget.text
{
	import flash.text.StyleSheet;
	import flash.utils.Dictionary;
	/**
	 * @author Lucas Motta
	 */
	public class CSS
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private static var _items : Dictionary;
		
		private static var _default : StyleSheet;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function CSS()
		{
			init();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS	
		// ----------------------------------------------------
		protected static function init() : void
		{
			if(_items == null)
			{
				_items = new Dictionary();
			}
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Add a StyleSheet to the Library
		 */
		public static function add(id : String, css : StyleSheet, isDefault : Boolean = false) : void
		{
			init();
			
			_items[id] = css;
			if(isDefault) _default = css;
		}
		
		/**
		 * Get a StyleSheet from the Library. If you don't set and id, the default css will be used
		 */
		public static function get(id : String = null) : StyleSheet
		{
			init();
			
			if(id == null) return defaultCSS;
			return _items.hasOwnProperty(id) ? _items[id] : null;
		}
		
		/**
		 * Remove a CSS from the Library
		 */
		public static function remove(id : String) : void
		{
			init();
			
			_items[id] = null;
			delete _items[id];
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public static function get defaultCSS() : StyleSheet
		{
			init();
			
			if(_default != null) return _default;
			for(var s : String in _items)
			{
				_default = _items[s];
				break;
			}
			return _default;
		}
	}
}
