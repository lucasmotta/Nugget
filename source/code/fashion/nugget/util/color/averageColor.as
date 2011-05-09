package fashion.nugget.util.color
{

	import flash.display.BitmapData;
	import flash.geom.Matrix;

	/**
	 * Get the average color of any display object
	 * 
	 * @param source						The source (MovieClip, Sprite, Bitmap, BitmapData, Video, etc...)
	 * @param size							The size that your source will be resized to get the color. Smaller number is faster, but less accurate.
	 */
	public function averageColor(source : *, size : int = 100) : uint
	{
		var scale : Number = source["width"] > source["height"] ? size / source["width"] : size / source["height"];

		var matrix : Matrix = new Matrix();
		matrix.scale(scale, scale);

		var bitmapData : BitmapData = new BitmapData(source["width"] * scale, source["height"] * scale, true, 0x00FFFFFF);
		bitmapData.draw(source, matrix);

		var red : int, green : int, blue : int;
		var color : uint, count : uint;
		var h : int, w : int;

		for (h = 0;h < bitmapData.height;h++)
		{
			for (w = 0;w < bitmapData.width;w++)
			{
				color = bitmapData.getPixel(w, h);
				red += (color & 0xFF0000) >>> 16;
				green += (color & 0x00FF00) >>> 8;
				blue += (color & 0x0000FF);
				count++;
			}
		}

		red /= count;
		green /= count;
		blue /= count;

		return red << 16 | green << 8 | blue;
	}
}
