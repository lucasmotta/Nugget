package
{

	import assets.font.PixelFont;
	import assets.font.PixelFontBold;

	import fashion.nugget.text.BasicText;
	import fashion.nugget.text.effects.TypeEffect;
	import fashion.nugget.view.View;

	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.StyleSheet;
	import flash.text.TextFormat;



	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="31", width="1000", height="700")]
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
			_strings.push("Flank ham ball tip, sirloin fatback rump ground round drumstick pastrami <strong>venison pig.</strong>");
			_strings.push("Ball tip boudin <a href='#'>turkey ham bresaola</a> tail, biltong tenderloin chicken jerky drumstick ham hock pancetta meatball pastrami.");
			_strings.push("Sirloin swine corned beef, spare <u>ribs</u> salami pastrami meatloaf rump andouille hamburger drumstick short loin brisket.");
			_strings.push("Corned beef tail pork ham, meatloaf <a href='#'>tenderloin ball tip shankle strip</a> steak bacon meatball beef spare ribs ribeye fatback. Spare ribs pork loin pastrami, short loin andouille ham strip steak tenderloin. <u>Shankle tri-tip bacon jerky.</u> Sirloin andouille short ribs rump, sausage shankle ribeye cow ball tip strip steak pork pork belly tenderloin brisket. Sausage pastrami ball tip, t-bone cow beef venison swine salami drumstick andouille. Flank <a href='#'>ribeye pork</a> loin pastrami. Bacon tail fatback beef tenderloin pancetta, tri-tip cow spare ribs pork belly ball tip tongue andouille jerky.\nFlank ham ball tip, sirloin fatback rump ground round drumstick pastrami venison pig. <a href='#'>Ham hock short ribs pastrami</a>, shoulder boudin cow venison. Rump shoulder pork chop sausage, shank shankle turkey tri-tip. Hamburger tongue boudin, tail jowl ground round pancetta tenderloin beef ribs t-bone pig drumstick. Bresaola shankle corned beef, rump ball tip bacon sirloin spare ribs fatback pork loin pork ham chicken tail. Short loin pork chop tenderloin t-bone ribeye. Shank <a href='#'>tri-tip</a> t-bone, ribeye ham hock pancetta tongue.");
			_strings.push("Shoulder fatback pig turkey, venison beef cow swine meatball pancetta ham brisket spare ribs.");
			_strings.push("Meatball pork loin fatback, sirloin <u>drumstick pork</u> boudin shank andouille ground round meatloaf.");
			_strings.push("Shankle rump biltong, tri-tip short ribs venison hamburger short loin.");
			_strings.push("Ribeye short ribs tongue beef ribs, salami pork loin meatball tail. Biltong <u>salami pig</u>, tri-tip boudin ball tip andouille.");
			_strings.push("Corned beef tail pork ham, meatloaf <a href='#'>tenderloin ball tip shankle strip</a> steak bacon meatball beef spare ribs ribeye fatback. Spare ribs pork loin pastrami, short loin andouille ham strip steak tenderloin. <u>Shankle tri-tip bacon jerky.</u> Sirloin andouille short ribs rump, sausage shankle ribeye cow ball tip strip steak pork pork belly tenderloin brisket. Sausage pastrami ball tip, t-bone cow beef venison swine salami drumstick andouille. Flank ribeye pork loin pastrami. Bacon tail fatback beef tenderloin pancetta, tri-tip cow spare ribs pork belly ball tip tongue andouille jerky.\nFlank ham ball tip, sirloin fatback rump ground round drumstick pastrami venison pig. <a href='#'>Ham hock short ribs pastrami</a>, shoulder boudin cow venison. Rump shoulder pork chop sausage, shank shankle turkey tri-tip. Hamburger tongue boudin, tail jowl ground round pancetta tenderloin beef ribs t-bone pig drumstick. Bresaola shankle corned beef, rump ball tip bacon sirloin spare ribs fatback pork loin pork ham chicken tail. Short loin pork chop tenderloin t-bone ribeye. Shank <a href='#'>tri-tip</a> t-bone, ribeye ham hock pancetta tongue.");
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			setupText();
		}
		
		protected function setupText() : void
		{
			_css = new StyleSheet();
			_css.setStyle("strong", { fontFamily:new PixelFontBold().fontName });
			_css.setStyle("a", { color:"#FF0033" });
			_css.setStyle("a:hover", { textDecoration:"underline" });
			
			_button = new BasicText("– randomize", new TextFormat(new PixelFontBold().fontName, 8, 0xFF0033), _css);
			_button.x = 50;
			_button.y = 50;
			_button.buttonMode = true;
			_button.mouseChildren = false;
			_button.effect = new TypeEffect(false, undefined, .7);
			_button.addEventListener(MouseEvent.ROLL_OVER, onRandomizeOver);
			_button.addEventListener(MouseEvent.ROLL_OUT, onRandomizeOut);
			_button.addEventListener(MouseEvent.CLICK, onRandomizeClick);
			addChild(_button);
			
			_text = new BasicText(_strings[0], new TextFormat(new PixelFont().fontName, 8, 0), _css);
			_text.pixelFont = true;
			_text.multiline = true;
			_text.width = 900;
			_text.x = 50;
			_text.y = 50 + 40;
			_text.effect = new TypeEffect(false, 0x999999);
			addChild(_text);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onRandomizeOver(e : MouseEvent) : void
		{
			_button.text = "– go ahead!";
		}
		
		protected function onRandomizeOut(e : MouseEvent) : void
		{
			_button.text = "– randomize";
		}
		
		protected function onRandomizeClick(e : MouseEvent) : void
		{
			_count++;
			_text.text = _strings[_count % _strings.length];
		}
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
