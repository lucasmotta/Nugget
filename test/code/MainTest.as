package
{

	import assets.sounds.Eletric;
	import fashion.nugget.Nugget;
	import fashion.nugget.core.INugget;
	import fashion.nugget.data.Settings;
	import fashion.nugget.events.NuggetEvent;
	import fashion.nugget.loader.BasicLoader;
	import fashion.nugget.nav.BasicNavigation;

	import com.lucas.Menu;
	import com.lucas.test.Home;
	import com.lucas.test.Portfolio;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="31", width="1000", height="700")]
	public class MainTest extends Sprite
	{

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _app : INugget;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function MainTest()
		{
			Home, Portfolio;
			
			_app = new Nugget("app", this);
			
			_app.settings = new Settings("assets/xml/settings.xml");
			_app.navigation = new BasicNavigation("assets/xml/navigation.xml");
			_app.loader = new BasicLoader();
			
			_app.addEventListener(NuggetEvent.READY, onAppReady);
			
			_app.init();
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onAppReady(e : NuggetEvent) : void
		{
			_app.views.add("menu", new Menu());
			_app.soundLibrary.add("eletric", new Eletric());
			//
			stage.addEventListener(MouseEvent.CLICK, onStageClick);
		}

		protected function onStageClick(e : MouseEvent) : void
		{
			if(e.shiftKey)
			{
				_app.soundLibrary.muteAll();
				return;
			}
			e.ctrlKey ? _app.soundLibrary.get("eletric").queue(true) : _app.soundLibrary.get("eletric").play();
			mouseX < 500 ? _app.navigation.to("home") : _app.navigation.to("portfolio");
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
