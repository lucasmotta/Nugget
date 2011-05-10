package fashion.nugget.data
{

	import flash.utils.Dictionary;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class Parameters extends Object
	{

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _params : Dictionary;

		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		private static var _instance : Parameters;


		public function Parameters()
		{
			_params = new Dictionary();
		}

		public static function getInstance() : Parameters
		{
			if (_instance == null)
			{
				_instance = new Parameters();
			}
			return _instance;
		}
		public static function get(key : String) : *
		{
			return Parameters.getInstance().get(key);
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function parse(query : String) : void
		{
			if (query.indexOf("?") == 0) query = query.slice(1, query.length);
			var array : Array = query.split("&");
			var equalId : int;
			var str : String;
			for each (str in array)
			{
				equalId = str.indexOf("=");
				if (equalId < 0) continue;
				_params[str.slice(0, equalId)] = str.slice(equalId + 1, str.length);
			}
		}

		public function add(key : String, value : *) : void
		{
			_params[key] = value;
		}

		public function get(key : String) : *
		{
			return _params[key];
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get params() : Dictionary
		{
			return params;
		}
	}
}
