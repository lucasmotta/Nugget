package fashion.nugget.util.display
{

	import flash.display.DisplayObject;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function safeRemoveChild(item : DisplayObject) : void
	{
		if (item == null) return;
		if (item.parent == null) return;
		if (item.parent.contains(item)) item.parent.removeChild(item);
		item = null;
	}
}
