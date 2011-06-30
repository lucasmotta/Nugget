package
{

	import fashion.nugget.text.BasicText;
	import fashion.nugget.view.View;

	import flash.display.StageScaleMode;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="31", width="1000", height="700")]
	public class AssetsTest extends View
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _text : BasicText;
		
		protected var _content : XML = <xml><text>Bacon ipsum dolor sit amet beef ham chicken fatback sirloin spare ribs. Fatback tail pork loin, short loin tongue pork pancetta shank boudin.</text></xml>;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function AssetsTest()
		{
			super();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
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
