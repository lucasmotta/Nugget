package fashion.nugget.core
{

	import fashion.nugget.loader.Dependencies;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ISectionView extends INuggetView, ITransition
	{
		
		function get dependencies() : Dependencies;
		
	}
}
