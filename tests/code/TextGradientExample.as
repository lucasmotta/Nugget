package
{

	import assets.font.Mensch;

	import fashion.nugget.text.GradientText;
	import fashion.nugget.view.View;

	import flash.filters.DropShadowFilter;
	import flash.text.TextFormat;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="31", width="1000", height="700")]
	public class TextGradientExample extends View
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _text : GradientText;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function TextGradientExample()
		{
			super();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			var textFormat : TextFormat = new TextFormat(new Mensch().fontName, 36, 0x666666);
			textFormat.leading = 4;
			
			_text = new GradientText("HELLO WORLD.\nI AM A GRADIENT TEXT\nAND I HAVE SUPPORT FOR MULTILINE TEXT!", [0x999999, 0x333333], textFormat);
			_text.x = 50;
			_text.y = 50;
			_text.width = 900;
			_text.multiline = true;
			_text.filters = [new DropShadowFilter(1, 90, 0, .3, 3, 3, 1, 3)];
			addChild(_text);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
