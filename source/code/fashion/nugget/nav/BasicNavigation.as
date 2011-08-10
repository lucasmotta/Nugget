package fashion.nugget.nav
{

	import fashion.nugget.core.INavigation;
	import fashion.nugget.core.INugget;
	import fashion.nugget.events.NavigationEvent;
	import fashion.nugget.loader.Dependencies;
	import fashion.nugget.nav.custom.CustomDependency;
	import fashion.nugget.nav.custom.CustomSection;

	import flash.events.EventDispatcher;


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class BasicNavigation extends EventDispatcher implements INavigation
	{

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private var _nugget : INugget;
		

		protected var _xml : XML;

		protected var _id : String;

		protected var _lastId : String;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 * 
		 * @param value				Either an URL for the XML or the XML itself
		 */
		public function BasicNavigation(xml : XML = null)
		{
			_xml = xml || <navigation />;
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Method called when the Nugget Application is ready
		 */
		public function init() : void
		{
			
		}
		
		/**
		 * Navigate to a specific section
		 * 
		 * @param id			Unique id of the specific section
		 */
		public function to(id : String) : void
		{
			if (_id == id) return;
			_lastId = _id;
			_id = id;

			this.nugget.loader.load(new Dependencies(new XML(_xml.child("section").(@id == _id))));
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE, false, false, _id));
		}

		/**
		 * Navigate to the default section (usually the "home" section)
		 */
		public function toDefault() : void
		{
			var str : String = xml.child("section").(attribute("default") == "true").attribute("id");
			if (str)
			{
				if (str.length > 0)
				{
					to(str);
				}
			}
		}
		
		/**
		 * Register a new section manually
		 * 
		 * @param section			Custom section parameters
		 * @param dependencies		CustomDependency
		 * 
		 * @example
		 <code>
			  register(new CustomSection("com.lucasmotta.section.Home", "home"), new CustomDependency("image.jpg", "main_image", "image", 200), new CustomDependency("content.xml", "my_xml", "xml", 50));
		 </code>
		 * 
		 */
		public function register(section : CustomSection, ...dependencies) : void
		{
			var node : XML = section.node;
			
			if (dependencies.length > 0)
			{
				var dependenciesNode : XML = <dependencies />;
				for each (var dependency : CustomDependency in dependencies)
				{
					dependenciesNode.appendChild(dependency.node);
				}
				node.appendChild(dependenciesNode);
			}

			_xml.appendChild(node);
		}
		
		/**
		 * Dispose
		 */
		public function dispose() : void
		{
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Get the navigation XML
		 */
		public function get xml() : XML
		{
			return _xml;
		}

		/**
		 * Get the current id
		 */
		public function get id() : String
		{
			return _id;
		}

		/**
		 * Get the last (previous) id
		 */
		public function get lastId() : String
		{
			return _lastId;
		}
		
		/**
		 * Nugget Application
		 */
		public function get nugget() : INugget
		{
			return _nugget;
		}

		public function set nugget(value : INugget) : void
		{
			_nugget = value;
		}
	}
}
