package fashion.nugget.util.number
{

	import flash.geom.Point;
	public function getAngle(first : Point, second : Point, rotation : Number = 0) : Number
	{
		var dx : Number = first.x - second.x;
		var dy : Number = first.y - second.y;
		var angle : Number = Math.atan2(dx, dy);
		angle /= (Math.PI / 180);
		angle = toStandardAngle(angle + rotation);
		return angle;
	}
}
