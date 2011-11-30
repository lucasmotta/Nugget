package fashion.nugget.core
{

	import fashion.nugget.data.Settings;

	import flash.core.ISprite;

	/**
	 * @author Lucas Motta
	 */
	public interface IAbstractApp extends IDisposable, ISprite
	{
		
		function set navigationXML(value : XML) : void
		
		function set settings(value : Settings) : void
	}
}
