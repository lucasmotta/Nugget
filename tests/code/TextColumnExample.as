package
{

	import assets.font.PixelFont;

	import fashion.nugget.text.ColumnText;
	import fashion.nugget.view.View;

	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	[SWF(backgroundColor="#99173C", frameRate="31", width="1000", height="700")]
	public class TextColumnExample extends View
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _xml : XML = <xml><![CDATA[Make no mistake, Microsoft isn't playing coy in the smartphone market any longer. The folks in Redmond are making a significant jump forward in the mobile arena, announcing that the upcoming version of Windows Phone, codenamed "Mango," will be heading to a device near you in time for the holidays. As its competitors have raised the bar of expectations to a much higher level, Microsoft followed suit by adding at least 500 features to its mobile investment, which the company hopes will plug all of the gaping holes the first two versions left open.
We received a Samsung Focus preloaded with the most recent developer build (read: not even close to the market release version) and we had a few good days to put it through its paces. It's still far from completion, as there were several key features that we couldn't test out; some weren't fully implemented, and others involved third-party apps that won't be updated until closer to launch. Yet we don't want to call this build half-baked -- in fact, it was surprisingly smooth for software that still has at least four months to go before it's available for public consumption.
At the risk of sounding ridiculously obvious, we're mighty interested in seeing the final result when all is said and done this holiday season. As a disclaimer, we can't guarantee that the stuff we cover here will actually look or act the same when it's ready to peek out and make its official introduction in Q4; as often happens, features and UI enhancements are subject to be changed by the Windows Phone team as Mango gets closer and closer to release. Let's get straight to brass tacks, since there's a lot of details to dive into. It'd be best to grab a large beverage (we'd recommend a Big Gulp, at least), find your most comfortable chair, and meet us after the break.
Make no mistake, Microsoft isn't playing coy in the smartphone market any longer. The folks in Redmond are making a significant jump forward in the mobile arena, announcing that the upcoming version of Windows Phone, codenamed "Mango," will be heading to a device near you in time for the holidays. As its competitors have raised the bar of expectations to a much higher level, Microsoft followed suit by adding at least 500 features to its mobile investment, which the company hopes will plug all of the gaping holes the first two versions left open.
We received a Samsung Focus preloaded with the most recent developer build (read: not even close to the market release version) and we had a few good days to put it through its paces. It's still far from completion, as there were several key features that we couldn't test out; some weren't fully implemented, and others involved third-party apps that won't be updated until closer to launch. Yet we don't want to call this build half-baked -- in fact, it was surprisingly smooth for software that still has at least four months to go before it's available for public consumption.
At the risk of sounding ridiculously obvious, we're mighty interested in seeing the final result when all is said and done this holiday season. As a disclaimer, we can't guarantee that the stuff we cover here will actually look or act the same when it's ready to peek out and make its official introduction in Q4; as often happens, features and UI enhancements are subject to be changed by the Windows Phone team as Mango gets closer and closer to release. Let's get straight to brass tacks, since there's a lot of details to dive into. It'd be best to grab a large beverage (we'd recommend a Big Gulp, at least), find your most comfortable chair, and meet us after the break.
Make no mistake, Microsoft isn't playing coy in the smartphone market any longer. The folks in Redmond are making a significant jump forward in the mobile arena, announcing that the upcoming version of Windows Phone, codenamed "Mango," will be heading to a device near you in time for the holidays. As its competitors have raised the bar of expectations to a much higher level, Microsoft followed suit by adding at least 500 features to its mobile investment, which the company hopes will plug all of the gaping holes the first two versions left open.
We received a Samsung Focus preloaded with the most recent developer build (read: not even close to the market release version) and we had a few good days to put it through its paces. It's still far from completion, as there were several key features that we couldn't test out; some weren't fully implemented, and others involved third-party apps that won't be updated until closer to launch. Yet we don't want to call this build half-baked -- in fact, it was surprisingly smooth for software that still has at least four months to go before it's available for public consumption.
At the risk of sounding ridiculously obvious, we're mighty interested in seeing the final result when all is said and done this holiday season. As a disclaimer, we can't guarantee that the stuff we cover here will actually look or act the same when it's ready to peek out and make its official introduction in Q4; as often happens, features and UI enhancements are subject to be changed by the Windows Phone team as Mango gets closer and closer to release. Let's get straight to brass tacks, since there's a lot of details to dive into. It'd be best to grab a large beverage (we'd recommend a Big Gulp, at least), find your most comfortable chair, and meet us after the break. ]]></xml>;
		
		protected var _text : ColumnText;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function TextColumnExample()
		{
			
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			stage.align = StageAlign.TOP;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var textFormat : TextFormat = new TextFormat(new PixelFont().fontName, 8, 0xFFFFFF);
			textFormat.leading = 4;
			
			_text = new ColumnText(_xml.toString(), textFormat);
			_text.columns = 3;
			_text.margin = 40;
			_text.x = _text.y = 50;
			_text.width = 900;
			_text.height = 420;
			_text.pixelFont = true;
			_text.apply();
			addChild(_text);
			
			onChangeTextHeight(null);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onChangeTextHeight);
		}

		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onChangeTextHeight(e : MouseEvent) : void
		{
			_text.height = Math.max(100, mouseY);
			_text.apply();
			
			this.graphics.clear();
			this.graphics.beginFill(0, .2);
			this.graphics.drawRect(40, 40, 920, _text.height + 20);
		}
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
