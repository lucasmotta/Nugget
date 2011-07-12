package
{

	import fashion.nugget.nav.BasicNavigation;
	import fashion.nugget.nav.custom.CustomDependency;
	import fashion.nugget.nav.custom.CustomSection;
	import fashion.nugget.view.View;

	import com.greensock.loading.ImageLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.XMLLoader;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class TestBasicNavigation extends View
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _nav : BasicNavigation;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function TestBasicNavigation()
		{
			super();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			LoaderMax.activate([ImageLoader, XMLLoader, SWFLoader]);
			
			_nav = new BasicNavigation();
			_nav.register(new CustomSection("com.lucasmotta.Class.swf", "class"), new CustomDependency("image.jpg", "imageId", "jpg", 200), new CustomDependency("content.xml", "xmlId", "xml"));
			_nav.register(new CustomSection("section.swf", "another", 100, true), new CustomDependency("image.jpg", "imageId", "jpg", 200));
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
