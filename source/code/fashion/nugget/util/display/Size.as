package fashion.nugget.util.display
{
	import flash.display.Stage;
	import flash.display.DisplayObject;

	/**
	 * @author		Lucas Motta (http://lucasmotta.com)
	 * @since		Sep 20, 2010
	 */
	public class Size
	{

		
		public var width : Number;

		public var height : Number;

		
		public function Size( width : Number = 0, height : Number = 0 )
		{
			this.width = width;
			this.height = height;
		}
		
		public static function get(source : DisplayObject) : Size
		{
			if(source == null) return new Size();
			if(source is Stage) return new Size(Stage(source).stageWidth, Stage(source).stageHeight);
			return new Size(source.width, source.height);
		}

		public function clone() : Size
		{
			return new Size(this.width, this.height);
		}

		public function toString() : String
		{
			return "[Size width=" + this.width + " height=" + this.height + "]";
		}
	}
}