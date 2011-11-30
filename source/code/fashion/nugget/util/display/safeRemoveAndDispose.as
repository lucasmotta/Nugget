package fashion.nugget.util.display
{

	import fashion.nugget.core.IDisposable;

	import flash.display.DisplayObject;

	/**
	 * @author Lucas Motta
	 */
	public function safeRemoveAndDispose(item : IDisposable) : *
	{
		if(item == null) return null;
		item.dispose();
		
		return safeRemoveChild(item as DisplayObject);
	}
}
