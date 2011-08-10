package fashion.nugget.core
{

	import flash.core.IDisplayObjectContainer;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface IView extends IDisposable, IDisplayObjectContainer
	{
		
		/**
		 * Method called when the stage is resized
		 */
		function resize() : void
		
		/**
		 * Bring the view to the front
		 */
		function bringToFront() : void
		
		/**
		 * Send the view back
		 */
		function sendToBack() : void
		
		/**
		 * Get if the stage is available or not
		 */
		function get ready() : Boolean
	}
}
