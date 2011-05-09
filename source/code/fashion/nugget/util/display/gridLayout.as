package fashion.nugget.util.display
{
	/**	
	 *	Return an array with positions based on a grid
	 *	
	 *	@param total					Total of Items
	 *	@param columns			 		Number of columns/lines
	 *	@param width			 		Item width
	 *	@param height			 		Item height
	 *	@param xSpacing		 			X spacing between each item
	 *	@param ySpacing		 			Y spacing between each item
	 *	@param direction				Value that defines if the grid start to the left to right or from top to bottom
	 */
	public function gridLayout(total : int, columns : int, width : int, height : int, xSpacing : int, ySpacing : int, horizontal : Boolean = true) : Array
	{
		var array : Array = [];
		var i : int;
		var posx : int;
		var posy : int;

		for (i = 0;i < total;i++)
		{
			posx = horizontal ? Math.round((width + xSpacing) * (i % columns)) : Math.round((width + xSpacing) * Math.floor(i / columns));
			posy = horizontal ? Math.round((height + ySpacing) * Math.floor(i / columns)) : Math.round((height + ySpacing) * (i % columns));
			array.push({ x:posx, y:posy });
		}
		return array;
	}
}
