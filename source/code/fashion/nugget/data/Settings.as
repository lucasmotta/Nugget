package fashion.nugget.data
{

	import fashion.nugget.Nugget;
	import fashion.nugget.util.toBoolean;
	import fashion.nugget.util.validation.isEmail;
	import fashion.nugget.util.validation.isEmpty;

	import flash.events.ContextMenuEvent;
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class Settings extends EventDispatcher
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		
		protected var _nugget : Nugget;
		
		
		protected var _xml : XML;
		
		
		protected var _hasStage : Boolean;
		
		protected var _stageAlign : String;
		
		protected var _stageScaleMode : String;
		
		
		protected var _hasContextMenu : Boolean;
		
		protected var _contextMenu : ContextMenu;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 * 
		 * @param value				Either an URL for the XML or the XML itself
		 */
		public function Settings(xml : XML)
		{
			_xml = xml;
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function setupStage() : void
		{
			_hasStage = true;
			_stageAlign = _xml.child("stage").child("align").toString() == "default" ? "" : _xml.child("stage").child("align").toString();
			_stageScaleMode = _xml.child("stage").child("scale").toString();
		}
		
		protected function setupContextMenu() : void
		{
			_hasContextMenu = true;
			
			_contextMenu = new ContextMenu();
			if(toBoolean(_xml.child("contextMenu").attribute("hideBuiltInItems"))) _contextMenu.hideBuiltInItems();
			
			var i : int;
			var list : XMLList = _xml.child("contextMenu").child("item");
			var length : int = list.length();
			var item : ContextMenuItem;
			var itemXML : XML;
			
			for(i = 0; i < length; i++)
			{
				itemXML = list[i];
				item = new ContextMenuItem(itemXML.child("caption"), toBoolean(itemXML.attribute("separatorBefore")), toBoolean(itemXML.attribute("enabled"), true), toBoolean(itemXML.attribute("visible"), true));
				item.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onContextMenuSelected);
				//
				_contextMenu.customItems.push(item);
			}
		}
		
		protected function parse(xml : XML) : void
		{
			_xml = xml;
			
			// STAGE
			if(_xml.hasOwnProperty("stage"))
			{
				setupStage();
			}
			// CONTEXTMENU
			if(_xml.hasOwnProperty("contextMenu"))
			{
				setupContextMenu();
			}
		}
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onContextMenuSelected(e : ContextMenuEvent) : void
		{
			var link : String = _xml.child("contextMenu").child("item").(child("caption") == e.target["caption"]).child("link").toString();
			var email : Boolean;
			if(!isEmpty(link))
			{
				email = isEmail(link);
				link = email ? "mailto:" + link : link;
				navigateToURL(new URLRequest(link), email ? null : "_blank");
			}
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function apply(nugget : Nugget) : void
		{
			_nugget = nugget;
			
			parse(_xml);
			
			if(_hasStage)
			{
				nugget.stage.align = _stageAlign;
				nugget.stage.scaleMode = _stageScaleMode;
			}
			if(_hasContextMenu)
			{
				nugget.container.contextMenu = _contextMenu;
			}
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function get nugget() : Nugget
		{
			return _nugget;
		}
	}
}
