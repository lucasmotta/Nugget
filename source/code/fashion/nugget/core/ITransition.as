package fashion.nugget.core
{
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ITransition
	{
		
		function transitionIn() : void;

		function transitionInComplete() : void;

		function transitionOut() : void;

		function transitionOutComplete() : void;
	}
}
