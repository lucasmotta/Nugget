package fashion.nugget.core
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface IViewLibrary
	{
		
		function add(id : String, view : INuggetView) : void
		
		function get(id : String) : INuggetView
		
		function remove(id : String) : void
	}
}
