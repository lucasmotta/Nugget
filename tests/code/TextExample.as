package
{

	import assets.font.PixelFont;
	import assets.font.PixelFontBold;

	import fashion.nugget.text.BasicText;
	import fashion.nugget.text.effects.MaskEffect;
	import fashion.nugget.text.effects.TypeEffect;
	import fashion.nugget.view.View;

	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.StyleSheet;
	import flash.text.TextFormat;



	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	[SWF(backgroundColor="#99173C", frameRate="31", width="1000", height="700")]
	public class TextExample extends View
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _text : BasicText;
		
		protected var _button : BasicText;
		
		
		protected var _css : StyleSheet;
		
		protected var _textFormat : TextFormat;
		
		
		protected var _strings : Array;
		
		protected var _count : int;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function TextExample()
		{
			_strings = [];
			_strings.push("Turkey pastrami hamburger, tail flank ham hock beef ribs jowl. Bresaola <a href='#'>strip steak pork</a> tenderloin ball tip. Tri-tip ham strip steak, chicken beef hamburger swine. Fatback swine spare ribs, tri-tip short loin jowl bacon pastrami shoulder ribeye biltong <a href='#'>sausage flank</a>. Jowl meatloaf andouille, venison fatback ground round pig tri-tip drumstick chuck pork loin bacon. Beef ribs swine pork chop spare ribs, venison bresaola pastrami shank ham biltong bacon flank. Pancetta andouille bresaola, <a href='#'>pork loin meatball</a> beef bacon short loin pork chop t-bone salami venison beef ribs sirloin.");
			_strings.push("Turkey rump salami pork cow, <a href='#'>short loin</a> ground round boudin ribeye short ribs. Jowl bresaola beef ribs swine, short loin ground round tenderloin meatball ham hock chicken boudin. Meatloaf <a href='#'>drumstick</a> corned beef, fatback short ribs cow chuck pig ham ribeye tri-tip pastrami shoulder salami spare ribs. Bacon ground round ham hock pastrami, venison ham strip steak shank pork belly sausage short loin. Chuck pork corned beef jerky tail, shankle chicken boudin beef. Swine tail boudin corned beef beef ribs, pork belly ham venison fatback bacon strip steak tongue. Pig andouille <a href='#'>pork chop</a>, drumstick swine biltong salami.");
			_strings.push("Salami pork loin sausage chicken, tri-tip tail pastrami ball tip rump. Pork venison pig tongue meatloaf. Pastrami biltong turkey bresaola. Ground round <a href='#'>swine brisket</a>, sirloin ham hock chicken pork chop salami. Pork loin jerky biltong, salami tri-tip pork belly shoulder turkey ham hock. Cow tri-tip jerky biltong, shankle hamburger corned beef flank beef ham ball tip venison t-bone <a href='#'>tenderloin</a>. Brisket pancetta pork loin ribeye, meatball ham beef ribs ground round venison salami pig meatloaf hamburger shankle chicken.");
			_strings.push("Short loin short ribs meatball, corned beef fatback pancetta tenderloin pig cow shankle bacon drumstick pork loin pork belly hamburger. Hamburger meatloaf brisket, ground round andouille t-bone chuck pork loin pork chop sirloin bacon boudin. Pork belly chuck ribeye tongue, <a href='#'>boudin flank ball tip</a>. Tail cow ribeye, tenderloin pork chop boudin chicken bresaola tongue biltong ground round. Pancetta meatball chicken, andouille bresaola brisket pastrami ham hock bacon flank pork loin. Chicken pig ham, meatloaf bresaola pork salami pork chop ground round short ribs pastrami. Andouille strip steak pancetta sirloin, meatloaf corned beef chuck shankle jerky tri-tip rump beef.");
			_strings.push("Sausage hamburger boudin pork belly turkey. Strip steak spare ribs pig bresaola sausage tail. Chicken andouille bacon strip steak, venison cow meatloaf salami shoulder short ribs. Chicken fatback cow corned beef salami <a href='#'>t-bone</a> meatloaf ham hamburger ribeye tri-tip. Corned beef meatball pork belly pig jowl brisket, rump shoulder pastrami flank pork spare ribs tail. Shankle venison <a href='#'>pastrami</a>, corned beef shank tongue shoulder meatball tail spare ribs strip steak pig hamburger. Salami fatback tri-tip, boudin venison ball tip <a href='#'>cow</a>.");
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			setupText();
		}
		
		protected function setupText() : void
		{
			_css = new StyleSheet();
			_css.setStyle("strong", { fontFamily:new PixelFontBold().fontName });
			_css.setStyle("a", { color:"#FFFFFF" });
			_css.setStyle("a:hover", { textDecoration:"underline" });
			
			_textFormat = new TextFormat(new PixelFont().fontName, 8, 0xF5BFCE);
			_textFormat.leading = 6;
			
			_button = new BasicText("– change text", new TextFormat(new PixelFontBold().fontName, 8, 0xFFFFFF), _css);
			_button.x = 50;
			_button.y = 50;
			_button.buttonMode = true;
			_button.mouseChildren = false;
			_button.effect = new TypeEffect(false, undefined, .7);
			_button.graphics.beginFill(0xFFFF00, 0);
			_button.graphics.drawRect(0, 0, _button.textField.width + 10, _button.textField.height);
			_button.addEventListener(MouseEvent.ROLL_OVER, onRandomizeOver);
			_button.addEventListener(MouseEvent.ROLL_OUT, onRandomizeOut);
			_button.addEventListener(MouseEvent.CLICK, onRandomizeClick);
			addChild(_button);
			
			_text = new BasicText(_strings[0], _textFormat, _css);
			_text.pixelFont = true;
			_text.multiline = true;
			_text.width = 400;
			_text.x = 50;
			_text.y = 50 + 40;
			//_text.effect = new AlphaEffect(1, .3);
			_text.effect = new MaskEffect(.7, .5, .05, .2);
			//_text.effect = new TypeEffect(false, 0xB6526E, 1.5);
			addChild(_text);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onRandomizeOver(e : MouseEvent) : void
		{
			_button.htmlText = "– go ahead!";
		}
		
		protected function onRandomizeOut(e : MouseEvent) : void
		{
			_button.htmlText = "– change text";
		}
		
		protected function onRandomizeClick(e : MouseEvent) : void
		{
			_count++;
			_text.htmlText = _strings[_count % _strings.length];
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
