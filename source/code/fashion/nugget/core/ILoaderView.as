package fashion.nugget.core
{


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ILoaderView extends INuggetView
	{
		
		function load(dependencies : IDependencies) : void
		
		
		function get dependencies() : IDependencies
		
		function set navigation(value : INavigation) : void
		
		function get navigation() : INavigation
		
	}
}
