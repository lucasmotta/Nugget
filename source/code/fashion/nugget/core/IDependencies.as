package fashion.nugget.core
{

	import com.greensock.loading.core.LoaderCore;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface IDependencies extends IDisposable
	{
		
		function get(id : String) : *
		
		function get queueLoader() : LoaderCore
		
		function get section() : ISectionView
		
		function get hasDependencies() : Boolean
	}
}
