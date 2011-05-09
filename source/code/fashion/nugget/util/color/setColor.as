package fashion.nugget.util.color
{

	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public function setColor(item : DisplayObject, color : uint) : void
	{
		var ct : ColorTransform = item.transform.colorTransform;
		ct.color = color;
		item.transform.colorTransform = ct;
	}
}
