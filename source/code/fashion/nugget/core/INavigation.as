package fashion.nugget.core
{

	import fashion.nugget.nav.custom.CustomSection;
	import flash.events.IEventDispatcher;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface INavigation extends IDisposable, IEventDispatcher
	{
		
		function to(id : String) : void
		
		function toDefault() : void
		
		function register(section : CustomSection, ...dependencies) : void
		
		
		function get id() : String
		
		function get lastId() : String
		
		function set nugget(value : INugget) : void
		
		function get nugget() : INugget
		
		function set loader(value : ILoaderView) : void
		
		function get loader() : ILoaderView
		
		function get xml() : XML
	}
}
