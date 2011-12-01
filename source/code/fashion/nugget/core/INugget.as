package fashion.nugget.core
{

	import flash.events.IEventDispatcher;
	import fashion.nugget.data.Settings;

	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface INugget extends IEventDispatcher, IDisposable
	{
		
		function init() : void
		
		function registerSections(...sections) : void
		
		
		function get id() : String
		
		function get container() :  DisplayObjectContainer
		
		
		function get settings() : Settings
		
		function set settings(value : Settings) : void
		
		
		function get loader() : ILoaderView
		
		function set loader(value : ILoaderView) : void
		
		
		function get navigation() : INavigation
		
		function set navigation(value : INavigation) : void
		
		
		function get cursor() : ICursor
		
		function set cursor(value : ICursor) : void
		
		
		function get stage() : Stage
		
		
		function get views() : IViewLibrary
		
		function get soundLibrary() : ISoundLibrary
	}
}
