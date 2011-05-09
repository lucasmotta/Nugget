package fashion.nugget.core
{

	import fashion.nugget.loader.Dependencies;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ILoaderView extends INuggetView
	{
		
		function load(dependencies : Dependencies) : void
		
		
		function get dependencies() : Dependencies
		
		function set navigation(value : INavigation) : void
		
		function get navigation() : INavigation
		
	}
}
