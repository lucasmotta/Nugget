package fashion.nugget.util.display
{

	import fashion.nugget.util.number.getAngle;

	import flash.geom.Point;

	/**	
	 *	Return an array with the position and rotation based on a circle
	 *	
	 *	@param total					Total of Items
	 *	@param radius					Radius of the circle
	 */
	public function circleLayout(total : int, radius : int) : Array
	{
		var i : int;
		var pos : Point;
		var angle : Number = 360 / total;
		var piece : Number;
		var radians : Number;
		var array : Array = [];

		for (i = 0;i < total;i++)
		{
			piece = (angle * i);
			radians = (Math.PI * 2 / 360) * piece;
			pos = new Point(Math.round(Math.cos(radians) * radius), Math.round(Math.sin(radians) * radius));
			array.push({ x:pos.x, y:pos.y, rotation:getAngle(new Point(), pos) });
		}
		return array;
	}
}
