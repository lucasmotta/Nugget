package fashion.nugget.util.number
{
	/**	
	 *	Return a standard angle between 0 and 360 degrees
	 *	
	 *	@param angle				The angle
	 */
	public function toStandardAngle(angle : Number) : Number
	{
		return (angle + 360) % 360;
	}
}
