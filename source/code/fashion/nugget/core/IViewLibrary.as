package fashion.nugget.core
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface IViewLibrary
	{
		
		/**
		 * Add a new instance NuggetView to the library
		 */
		function add(id : String, view : INuggetView) : void
		
		/**
		 * Get a view from the library
		 */
		function get(id : String) : INuggetView
		
		/**
		 * Remove a view from the library
		 */
		function remove(id : String) : void
	}
}
