package fashion.nugget.core
{

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ISectionView extends INuggetView, ITransition
	{
		
		/**
		 * Section Dependencies
		 */
		function get dependencies() : IDependencies;
		
	}
}
