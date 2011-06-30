package fashion.nugget.nav
{

	import fashion.nugget.core.ILoaderView;
	import fashion.nugget.core.INavigation;
	import fashion.nugget.core.INugget;
	import fashion.nugget.events.NavigationEvent;
	import fashion.nugget.loader.Dependencies;

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
		private var _loader : ILoaderView;

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
			
			init();
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function init() : void
		{
			
		}
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
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

			_loader.load(new Dependencies(new XML(_xml.child("section").(@id == _id))));
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
		 * @param parameters		Parameters of your section ({ view:"com.domain.YourClass" } or { file:"file.swf", estimatedBytes=200 })
		 * @param dependencies		Dependencies ({ id:"my_xml_id", type:"xml", estimatedBytes:50, file:"file.xml" })
		 * 
		 * @example
		 <code>
			  register({ view:"com.lucasmotta.section.Home" }, { id:"main_image", type:"image", estimatedBytes:200, file:"image.jpg" }, { id:"my_xml", type:"xml", estimatedBytes:50, file:"file.xml" });
		 </code>
		 * 
		 */
		public function register(parameters : Object, ...dependencies) : void
		{
			var view : String = parameters["view"];
			var file : String = parameters["file"];
			var estimatedBytes : String = parameters["estimatedBytes"];

			var node : XML = <section />;
			node.appendChild(view != null ? <view>{view}</view> : estimatedBytes == null ? <file>{file}</file> : <file estimatedBytes={estimatedBytes}>{file}</file>);
			if (dependencies.length > 0)
			{
				var dependenciesNode : XML = <dependencies />;
				var count : int;
				for each (var obj : * in dependencies)
				{
					dependenciesNode.appendChild(<dependency id={obj["id"] || count} type={obj["type"] || ""} estimatedBytes={obj["estimatedBytes"] || "200"}>{obj["file"]}</dependency>);
					count++;
				}
				node.appendChild(dependenciesNode);
			}

			_xml.appendChild(node);
		}

		public function dispose() : void
		{
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
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

		public function get loader() : ILoaderView
		{
			return _loader;
		}

		public function set loader(value : ILoaderView) : void
		{
			_loader = value;
		}

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
