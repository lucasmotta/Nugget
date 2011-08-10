package fashion.nugget.core
{


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public interface ILoaderView extends INuggetView
	{
		
		/**
		 * Load the section and his dependencies
		 * 
		 * @param dependencies			Dependencies to load (including the own section)
		 */
		function load(dependencies : IDependencies) : void
		
		
		/**
		 * Sets whether the current section will wait the new section load, before being removed from the stage.
		 * If you set the value as <code>false</code>, the current section will be removed and then the new section will start to load.
		 * But if you set as <code>true</code>, the new section will load instantly. And after the load finishes is that the current section will be removed.
		 */
		function get waitLoader() : Boolean
		
		function set waitLoader(value : Boolean) : void
		
		/**
		 * Section dependencies
		 */
		function get dependencies() : IDependencies
		
	}
}
