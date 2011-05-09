package fashion.nugget.util.display
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	
	/**
	 * 
	 * 	This method returns a Rectangle with the real visual DisplayObject bounds.
	 * 
	 * 	@param					p_source					Source to get real visual bounds.
	 * 
	 * 	@return												The real visual DisplayObject bounds.
	 * 
	 * 	@example
	 *	<pre>
	 *	import flash.text.TextField;
	 *	import flash.geom.Rectangle;
	 *	import flash.display.Shape;
	 *  import rinaldi.display.getVisualBounds;
	 * 
	 *	var label : TextField;
	 *	var visualBounds : Rectangle;
	 *	var rect : Shape;
	 * 
	 *	label = new TextField();
	 *	label.text = "Lorem Ipsum";
	 *	label.width = 200;
	 *	label.height = 50;
	 *	addChild(label);
	 * 
	 *	visualBounds = getVisualBounds(label);
	 *	rect = new Shape();
	 *	with(rect.graphics) beginFill(0xcc0000), drawRect(visualBounds.x, visualBounds.y, visualBounds.width, visualBounds.height);
	 *	addChild(rect);
	 * 
	 *	trace("The visual 'label' dimensions:", visualBounds.width, visualBounds.height);
	 *	</pre>	
	 * 
	 * 	@see rinaldi.display
	 * 
	 * 	@author Rafael Rinaldi, Arthur Debert and Gabriel Laet.
	 * 
	 * */
	
	public function getVisualBounds( p_source : DisplayObject, width : int = 1000, height : int = 1000) : Rectangle
	{
		var rect : Rectangle;
		var data : BitmapData;
		
		data = new BitmapData(width, height, true, 0x00000000);
		data.draw(p_source);
		
		rect = data.getColorBoundsRect(0xff000000, 0x00000000, false);
		
		if(rect == null)
			rect = new Rectangle();
		
		data.dispose();
		data = null;
		
		return rect;
	}
}