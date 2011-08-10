package fashion.nugget.core
{

	import fashion.nugget.nav.custom.CustomSection;

	import flash.events.IEventDispatcher;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface INavigation extends IDisposable, IEventDispatcher
	{
		
		/**
		 * Method called when the Nugget Application is ready
		 */
		function init() : void
		
		/**
		 * Navigate to a specific section
		 * 
		 * @param id			Unique id of the specific section
		 */
		function to(id : String) : void
		
		/**
		 * Navigate to the default section (usually the "home" section)
		 */
		function toDefault() : void
		
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
		function register(section : CustomSection, ...dependencies) : void
		
		
		/**
		 * Get the current id
		 */
		function get id() : String
		
		/**
		 * Get the last (previous) id
		 */
		function get lastId() : String
		
		/**
		 * Get the navigation XML
		 */
		function get xml() : XML
		
		/**
		 * Nugget Application
		 */
		function set nugget(value : INugget) : void
		
		function get nugget() : INugget
	}
}
