package fashion.nugget.util.display
{
	
	/**
	 * @author		Lucas Motta (http://lucasmotta.com)
	 * @since		Sep 20, 2010
	 */
	public class ResizeUtil 
	{

		public static const FULL : String = "full";
		
		public static const FIT : String = "fit";

		public static const FIT_HEIGHT : String = "fitHeight";

		public static const FIT_WIDTH : String = "fitWidth";
		
		/**
		 * Return a new size based on the resize type, the original size and the new size.
		 */
		public static function resize(type : String, originalSize : Size, newSize : Size) : Size
		{
			switch(type)
			{
				case ResizeUtil.FULL :
					return full(originalSize, newSize);
					break;
				case ResizeUtil.FIT :
					return fit(originalSize, newSize);
					break;
				case ResizeUtil.FIT_WIDTH :
					return fitWidth(originalSize, newSize);
					break;
				case ResizeUtil.FIT_HEIGHT :
					return fitHeight(originalSize, newSize);
					break;
			}
			return originalSize;
		}
		
		/**
		 * Full the width and height based on the new size
		 */
		public static function full(originalSize : Size, newSize : Size) : Size
		{
			var scaleX : Number = newSize.width / originalSize.width;
			var scaleY : Number = newSize.height / originalSize.height;
			
			if(scaleX >= scaleY)
			{
				newSize.width = originalSize.width * scaleX;
				newSize.height = originalSize.height * scaleX;
			}
			else
			{
				newSize.width = originalSize.width * scaleY;
				newSize.height = originalSize.height * scaleY;
			}
			
			return newSize;
		}

		/**
		 * Fit the width and height based on the new size
		 */
		public static function fit(originalSize : Size, newSize : Size) : Size
		{
			var scaleX : Number = newSize.width / originalSize.width;
			var scaleY : Number = newSize.height / originalSize.height;
			
			if(scaleX >= scaleY)
			{
				newSize = fitHeight(originalSize, newSize);
			}
			else
			{
				newSize = fitWidth(originalSize, newSize);
			}
			
			return newSize;
		}

		/**
		 * Fit the width based on the new size
		 */
		public static function fitWidth(originalSize : Size, newSize : Size) : Size
		{
			var scale : Number = newSize.width / originalSize.width;
			
			return new Size(newSize.width, originalSize.height * scale);
		}

		/**
		 * Fit the height based on the new size
		 */
		public static function fitHeight(originalSize : Size, newSize : Size) : Size
		{
			var scale : Number = newSize.height / originalSize.height;
			
			return new Size(originalSize.width * scale, newSize.height);
		}
	}
}