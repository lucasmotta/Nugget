package fashion.nugget.text.effects
{


	import fashion.nugget.display.Box;
	import fashion.nugget.motion.SleekTween;
	import fashion.nugget.text.BasicText;
	import fashion.nugget.util.display.safeRemoveChild;

	import com.greensock.TweenLite;

	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextLineMetrics;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class MaskEffect extends AbstractEffect
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _currentMask : Sprite;
		
		protected var _lastMask : Sprite;
		
		protected var _oldText : String;
		
		
		protected var _timeIn : Number;
		
		protected var _timeOut : Number;
		
		protected var _interval : Number;
		
		protected var _delayInOut : Number;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function MaskEffect(timeIn : Number = 1, timeOut : Number = .5, interval : Number = 1, delayInOut : Number = 0)
		{
			_timeIn = timeIn;
			_timeOut = timeOut;
			_interval = interval;
			_delayInOut = delayInOut;
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function createMask() : void
		{
			var i : int;
			var length : int = _source.textField.numLines;
			var box : Box;
			var metrics : TextLineMetrics;
			var rect : Rectangle;
			var hasPreviousText : Boolean = _currentMask != null;
			
			if(_currentMask)
			{
				_source.textField.mask = null;
				animateOut();
			}
			
			_currentMask = new Sprite();
			_source.textField.mask = _currentMask;
			_source.addChild(_currentMask);
			
			// TODO I have to change the text height because of a weird bug with getCharBoundaries
			_source.textField.height = _source.textField.textHeight + 5;
			
			for(i = 0; i < length; i++)
			{
				if(i >= _source.textField.numLines) break;
				rect = _source.textField.getCharBoundaries(_source.textField.getLineOffset(i));
				metrics = _source.textField.getLineMetrics(i);
				if(rect == null || metrics == null) continue;
				
				box = new Box(0xFFFFFF * Math.random(), metrics.width + metrics.x, rect.height);
				box.y = rect.y;
				box.alpha = .5;
				_currentMask.addChild(box);
			}
			
			animateIn(hasPreviousText ? _delayInOut : 0);
		}
		
		protected function getLineWidth(index : int) : Number
		{
			if(index >= _source.textField.numLines)
			{
				return _source.width;
			}
			var metrics : TextLineMetrics = _source.textField.getLineMetrics(index);
			return metrics ? metrics.width : _source.width;
		}
		
		protected function animateIn(delay : Number = 0) : void
		{
			var i : int;
			var length : int = _currentMask.numChildren;
			
			for(i = 0; i < length; i++)
			{
				_currentMask.getChildAt(i).scaleX = 0;
				TweenLite.killTweensOf(_currentMask.getChildAt(i));
				SleekTween.to(_currentMask.getChildAt(i), _timeIn, { scaleX:1, delay:_interval * i + delay } );
			}
		}
		
		protected function animateOut() : void
		{
			var i : int;
			var length : int = _currentMask.numChildren;
			var onComplete : Function;
			var onCompleteParams : Array;
			var txt : BasicText = _source.clone();
			txt.htmlText = _oldText;
			_source.addChild(txt);
			
			txt.textField.mask = _currentMask;
			
			for(i = 0; i < length; i++)
			{
				if(i == length - 1)
				{
					onComplete = disposeText;
					onCompleteParams = [txt, _currentMask];
				}
				TweenLite.killTweensOf(_currentMask.getChildAt(i));
				SleekTween.to(_currentMask.getChildAt(i), _timeOut, { scaleX:0, x:_source.width, delay:_interval * i, onComplete:onComplete, onCompleteParams:onCompleteParams } );
			}
		}
		
		protected function disposeText(text : BasicText, container : Sprite) : void
		{
			text.dispose();
			safeRemoveChild(text);
			safeRemoveChild(container);
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function set htmlText(value : String) : void
		{
			_oldText = _source.textField.htmlText;
			_source.textField.htmlText = value;
			
			createMask();
		}
		
		override public function set text(value : String) : void
		{
			_source.textField.text = value;
			
			createMask();
		}
			
		override public function set source(value : BasicText) : void
		{
			super.source = value;
			
			_source.textField.htmlText = _source.content;
			createMask();
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
