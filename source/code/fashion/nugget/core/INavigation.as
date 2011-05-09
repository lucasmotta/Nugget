package fashion.nugget.core
{

	import flash.events.IEventDispatcher;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface INavigation extends IDisposable, IEventDispatcher
	{
		
		function to(id : String) : void
		
		function load() : void
		
		
		function set nugget(value : INugget) : void
		
		function get nugget() : INugget
		
		function set loader(value : ILoaderView) : void
		
		function get loader() : ILoaderView
		
		function get xml() : XML
	}
}
