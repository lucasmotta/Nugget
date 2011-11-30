package fashion.nugget.util.display
{

	import flash.display.DisplayObject;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function safeRemoveChild(item : DisplayObject) : *
	{
		if (item == null) return null;
		if (item.parent == null) return item;
		if (item.parent.contains(item)) item.parent.removeChild(item);
		return null;
	}
}
