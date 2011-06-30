package fashion.nugget.core
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ICursor extends INuggetView
	{
		
		function press() : void
		
		function release() : void
		
		function rollOver() : void
		
		function rollOut() : void
		
		function drag() : void
		
		function dragStop() : void
		
		function show() : void
		
		function close() : void
	}
}
