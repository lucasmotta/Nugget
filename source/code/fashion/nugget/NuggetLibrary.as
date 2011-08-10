package fashion.nugget
{

	import fashion.nugget.core.INugget;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class NuggetLibrary
	{
		
		private static var _library : Object = {};
		
		/**
		 * Register a new Nugget application
		 */
		public static function add(id : String, nugget : INugget) : void
		{
			if(exist(id))
			{
				throw new Error("Choose a different id for this application.");
			}
			_library[id] = nugget;
		}
		
		/**
		 * Unregister a Nugget application
		 */
		public static function remove(id : String) : void
		{
			if(!exist(id))
			{
				trace("Seems that this application does not exists. So we can't unregister that, right? But we forgive you for now.");
				return;
			}
			_library[id] = null;
			delete _library[id];
		}
		
		/**
		 * Get a Nugget application
		 */
		public static function get(id : String) : INugget
		{
			if(!exist(id))
			{
				throw new Error("This application does not exists. Try calling the \"exist\" method first.");
			}
			return _library[id];
		}
		
		/**
		 * Check if an application exists
		 */
		public static function exist(id : String) : Boolean
		{
			return _library.hasOwnProperty(id);
		}
	}
}
