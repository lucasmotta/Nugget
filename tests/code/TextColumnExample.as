package
{

	import assets.font.PixelFont;

	import fashion.nugget.display.Box;
	import fashion.nugget.text.ColumnText;
	import fashion.nugget.view.View;

	import com.bit101.components.HUISlider;
	import com.bit101.components.Label;
	import com.bit101.components.Style;

	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.geom.Rectangle;
	import flash.system.Security;
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
		protected var _xml : XML = <xml><![CDATA[Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et gravida lorem. Vestibulum rhoncus quam nec libero consectetur ut suscipit nibh semper. Nulla fringilla porta tellus eget placerat. Quisque sed nunc eu odio auctor consectetur. Fusce at faucibus orci. Vivamus sit amet risus dolor, ut fermentum dolor. Aliquam enim urna, eleifend quis congue non, bibendum quis massa. Nullam nisl sapien, porta blandit gravida id, semper sit amet massa. Integer fermentum facilisis arcu nec ultricies. Cras sed arcu vel sem commodo congue. In eu dictum justo. Ut nibh nunc, aliquet vel congue auctor, condimentum non leo. Morbi sed condimentum est. Ut dolor nulla, luctus ac rhoncus at, lacinia eget lectus. Mauris massa dui, auctor nec sodales eget, porta congue metus. Suspendisse non pellentesque nisi. Nunc justo diam, placerat non sollicitudin a, posuere in dolor.

Aenean vel neque a lorem blandit consequat. Sed quis ligula lacus, in blandit urna. Phasellus pretium felis eu ante fermentum ut porttitor mauris malesuada. Phasellus vel erat enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse potenti. Phasellus eu nunc vitae sem tincidunt placerat sed at ipsum. Mauris ornare ipsum vitae mi congue porta. Phasellus quis felis tellus, sodales imperdiet erat. Phasellus semper commodo ultricies. Phasellus pretium, urna id semper tempor, massa justo blandit quam, tincidunt aliquam neque diam ac orci. Nulla rutrum, nisl ac ornare imperdiet, velit ante viverra sapien, eget dictum leo magna cursus ante. Curabitur pharetra neque convallis lectus tristique at dignissim enim lacinia. Ut nec mauris magna. Praesent nibh nulla, pellentesque at suscipit auctor, imperdiet et ipsum.

Praesent sapien nunc, gravida at ullamcorper eu, malesuada in orci. Praesent pulvinar pretium sem, quis interdum orci dictum sit amet. Nulla tristique rhoncus pellentesque. Nulla mattis sem ut lacus posuere vitae rutrum ante iaculis. Nulla blandit, felis non tincidunt vehicula, turpis erat accumsan turpis, ac fringilla leo nisl non nibh. Morbi et lorem ut ligula tempor facilisis id et augue. Mauris et augue felis. Quisque quis purus est. Sed urna massa, dictum nec porta vel, tincidunt et ipsum. Phasellus mollis, dolor vitae ultricies commodo, tortor velit feugiat risus, vitae pharetra velit urna sed urna. Donec sollicitudin, sapien quis adipiscing sodales, libero nisi facilisis felis, non molestie mi quam at arcu. Cras id felis non purus ornare scelerisque id sit amet urna. Etiam velit leo, tempor eget auctor at, ultrices nec justo. Etiam vitae dui turpis. Cras orci urna, ornare at sollicitudin et, dignissim id libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.

Nullam vel urna eu ante cursus aliquam bibendum ut enim. Suspendisse euismod euismod velit, sit amet lobortis justo consectetur vel. Duis vitae dolor id libero vulputate condimentum. In nulla metus, mollis mattis mollis vel, porttitor sed dui. Sed sed dolor lacus. Fusce et risus risus, ac fermentum lacus. Maecenas ullamcorper consectetur mattis. In rhoncus tempus vehicula. Quisque diam odio, laoreet ut vulputate sed, pulvinar sed ante. In lacus nisi, vulputate sed ullamcorper non, tempus a nulla. Aenean dignissim ligula in diam iaculis sagittis bibendum lectus interdum. Pellentesque tincidunt posuere eros, viverra pharetra libero faucibus ut. Aenean ac orci non elit convallis pulvinar. Donec purus magna, tempus nec blandit at, congue sit amet purus. Integer condimentum consectetur fringilla.

In tortor dui, ullamcorper eu pharetra nec, vehicula eu eros. Nam vehicula venenatis rutrum. Vestibulum pellentesque quam vitae mauris interdum tincidunt. Morbi ornare consequat eros sit amet posuere. Donec varius, mi ac consectetur iaculis, urna orci feugiat risus, in vestibulum lorem nulla eget elit. Sed dapibus dui vel ligula euismod eget adipiscing dolor aliquet. Praesent at odio nisl, quis laoreet odio. Nulla vulputate laoreet sem, a varius sem sagittis sit amet. Vestibulum nec urna ac nunc porta posuere. Maecenas ante arcu, consequat nec interdum in, facilisis ac lacus. Suspendisse blandit, lacus eu sodales rutrum, sapien augue tristique magna, et condimentum mi magna vitae eros. In hac habitasse platea dictumst. Curabitur elementum, justo a blandit auctor, turpis ante gravida nibh, fringilla tincidunt diam mauris non libero. Cras tincidunt nisi non neque dapibus volutpat. Donec in lorem congue mi convallis consequat sed vitae neque.

Donec non nibh elit. Nulla facilisi. Vestibulum eget tortor lectus, et convallis est. Cras lobortis felis diam. Nulla feugiat dignissim ante convallis luctus. Maecenas dapibus felis id nulla convallis at consequat arcu posuere. Suspendisse rhoncus rhoncus orci, a volutpat eros feugiat eu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nec nulla velit. Nam molestie sollicitudin vulputate. Vivamus dolor nulla, commodo ac volutpat quis, interdum in ipsum. Phasellus eu metus id purus eleifend dapibus. Donec orci elit, ornare sed ultrices eu, viverra sit amet felis. Quisque congue vehicula elementum.

Vivamus elit turpis, vestibulum eu vestibulum ut, convallis eu neque. Integer id nunc orci. Sed congue orci et velit fermentum aliquam aliquet ante dignissim. Donec at orci nulla. Donec pharetra consequat consectetur. Proin at arcu at turpis euismod mattis eu id nibh. Nulla facilisi. Praesent nec justo ac nulla auctor porta sit amet sit amet augue. Curabitur interdum nunc ut leo hendrerit cursus. Duis vitae quam justo. Duis sed placerat ligula. Aliquam erat volutpat. In hac habitasse platea dictumst. Cras non pharetra dolor. Vestibulum nec ullamcorper libero. Etiam id tincidunt velit. Sed mauris eros, dignissim scelerisque condimentum vitae, consectetur sed mi.

Sed nec sapien dui. Vestibulum eu justo lectus, nec volutpat lacus. Sed risus justo, rutrum ut sollicitudin id, adipiscing a nibh. Suspendisse ut purus non sapien eleifend venenatis eget mattis arcu. Ut quis elit dui. Nulla quis ante nisi. Cras pharetra, metus et ultrices pulvinar, sapien velit egestas velit, et egestas diam orci in est. Mauris massa ipsum, varius eu gravida sit amet, aliquam ac magna. Etiam erat nunc, dignissim vitae mattis sed, euismod et dolor. Suspendisse ac malesuada nisi.]]></xml>;
		
		protected var _holder : Sprite;
		
		protected var _text : ColumnText;
		
		protected var _drag : Box;
		
		protected var _dragLabel : Label;
		
		protected var _sliderHolder : Sprite;
		
		protected var _sliderColumns : HUISlider;
		
		protected var _sliderMargin : HUISlider;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function TextColumnExample()
		{
			Security.allowDomain(this.root.loaderInfo.loaderURL, "http://lucasmotta.com", "*.lucasmotta.com", "*", "*.tumblr.com", "http://labs.lucasmotta.com");
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.showDefaultContextMenu = false;
			
			_holder = new Sprite();
			addChild(_holder);
			
			setupUI();
			setupText();
			setupDrag();
		}

		protected function setupUI() : void
		{
			Style.BACKGROUND = 0x7A1230;
			Style.INPUT_TEXT = 0xFFFFFF;
			Style.LABEL_TEXT = 0xFFFFFF;
			
			_sliderHolder = new Sprite();
			_sliderHolder.x = 40;
			_sliderHolder.y = 40;
			_holder.addChild(_sliderHolder);
			
			_sliderColumns = new HUISlider(_sliderHolder, 0, 0, "COLUMNS", onSliderChange);
			_sliderColumns.minimum = 1;
			_sliderColumns.maximum = 6;
			_sliderColumns.labelPrecision = 0;
			_sliderColumns.tick = 1;
			_sliderColumns.value = 3;
			
			_sliderMargin = new HUISlider(_sliderHolder, int(_sliderColumns.x + _sliderColumns.width), 0, "MARGIN", onSliderChange);
			_sliderMargin.minimum = 0;
			_sliderMargin.maximum = 50;
			_sliderMargin.labelPrecision = 0;
			_sliderMargin.tick = 5;
			_sliderMargin.value = 30;
		}
		
		protected function setupText() : void
		{
			var textFormat : TextFormat = new TextFormat(new PixelFont().fontName, 8, 0xFFFFFF);
			textFormat.leading = 4;
			
			_text = new ColumnText(_xml.toString(), textFormat);
			_text.columns = _sliderColumns.value;
			_text.margin = _sliderMargin.value;
			_text.x = 50;
			_text.y = 80;
			_text.width = 900;
			_text.height = 420;
			_text.pixelFont = true;
			_text.apply();
			_holder.addChild(_text);
		}
		
		protected function setupDrag() : void
		{
			_drag = new Box(0xFFFFFF, 48, 20);
			_drag.y = 300;
			_drag.radius = 20;
			_drag.buttonMode = true;
			_drag.mouseChildren = false;
			_drag.filters = [new DropShadowFilter(2, 45, 0, .2, 3, 3, 1, 3)];
			_drag.addEventListener(MouseEvent.MOUSE_DOWN, onStartDrag);
			_holder.addChild(_drag);
			
			_dragLabel = new Label(_drag, 10, 1, "DRAG");
			_dragLabel.textField.defaultTextFormat = new TextFormat(null, null, 0x99173C);
			
			_text.height = Math.max(100, _drag.y - _text.y);
			_text.apply();
			
			drawBackground();
		}
		
		protected function drawBackground() : void
		{
			_holder.graphics.clear();
			_holder.graphics.beginFill(0, .2);
			_holder.graphics.drawRect(_text.x - 10, _text.y - 10, _text.width + 20, _text.height + 20);
			_holder.graphics.beginFill(0xFFFFFF, .2);
			_holder.graphics.drawRect(_text.x - 10, _text.y + _text.height + 10, _text.width + 20, 1);
		}
		
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onSliderChange(e : Event) : void
		{
			_text.columns = _sliderColumns.value;
			_text.margin = _sliderMargin.value;
			_text.apply();
		}
		
		protected function onStartDrag(e : MouseEvent) : void
		{
			_drag.startDrag(false, new Rectangle(_drag.x, 100 + _text.y, 0, 700));
			
			stage.addEventListener(MouseEvent.MOUSE_UP, onStopDrag);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onChangeTextHeight);
		}
		
		protected function onStopDrag(e : MouseEvent) : void
		{
			_drag.stopDrag();
			
			stage.removeEventListener(MouseEvent.MOUSE_UP, onStopDrag);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onChangeTextHeight);
		}
		
		protected function onChangeTextHeight(e : MouseEvent = null) : void
		{
			_text.height = Math.max(100, _drag.y - _text.y);
			_text.apply();
			
			drawBackground();
		}
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function resize() : void
		{
			_holder.y = int(700 * .5 - stage.stageHeight * .5);
			
			_text.width = stage.stageWidth - 100;
			_text.x = int(1000 * .5 - stage.stageWidth * .5) + 50;
			_text.apply();
			
			_sliderHolder.x = int(1000 * .5 - stage.stageWidth * .5) + 40;
			_drag.x = int(1000 * .5 - _drag.width * .5);
			
			drawBackground();
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
