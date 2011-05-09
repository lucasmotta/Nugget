package fashion.nugget.core
{

	import flash.core.IDisplayObjectContainer;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface IView extends IDisposable, IDisplayObjectContainer
	{
		
		function resize() : void
		
		function bringToFront() : void
		
		function sendToBack() : void
		
		
		function get ready() : Boolean
	}
}
