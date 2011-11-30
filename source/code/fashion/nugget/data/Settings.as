package fashion.nugget.data
{

	import fashion.nugget.core.INugget;
	import fashion.nugget.util.toBoolean;
	import fashion.nugget.util.validation.isEmail;
	import fashion.nugget.util.validation.isEmpty;
	import flash.display.Stage;
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
		protected var _nugget : INugget;
		
		protected var _stage : Stage;
				
		protected var _xml : XML;
				
		protected var _contextMenu : ContextMenu;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 * 
		 * @param value				Either an URL for the XML or the XML itself
		 */
		public function Settings(xml : XML, stage : Stage)
		{
			_xml = xml;
			_stage = stage;
			
			if(_xml.hasOwnProperty("stage"))
			{
				setupStage();
			}
			if(_xml.hasOwnProperty("contextMenu"))
			{
				setupContextMenu();
			}
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function setupStage() : void
		{
			var stageAlign : String = _xml.child("stage").child("align").toString() == "default" ? "" : _xml.child("stage").child("align").toString();
			var stageScaleMode : String = _xml.child("stage").child("scale").toString();
			var stageQuality : String = _xml.child("stage").child("quality").toString();
			
			if(!isEmpty(stageAlign)) _stage.align = stageAlign;
			if(!isEmpty(stageScaleMode)) _stage.scaleMode = stageScaleMode;
			if(!isEmpty(stageQuality)) _stage.quality = stageQuality;
		}
		
		protected function setupContextMenu() : void
		{
			_contextMenu = new ContextMenu();
			
			if(toBoolean(_xml.child("contextMenu").attribute("hideBuiltInItems")))
			{
				_contextMenu.hideBuiltInItems();
				_stage.showDefaultContextMenu = false;
			}
			
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
				_contextMenu.customItems.push(item);
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
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function set nugget(value : INugget) : void
		{
			_nugget = value;
			if(_contextMenu)
			{
				_nugget.container.contextMenu = _contextMenu;
			}
		}

		public function get xml() : XML
		{
			return _xml;
		}
	}
}
