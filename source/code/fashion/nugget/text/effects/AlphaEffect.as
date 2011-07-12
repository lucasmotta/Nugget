package fashion.nugget.text.effects
{

	import fashion.nugget.text.BasicText;
	import fashion.nugget.core.ITextEffect;
	import fashion.nugget.util.validation.isEmpty;

	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class AlphaEffect extends AbstractEffect implements ITextEffect
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _timeIn : Number;
		
		protected var _timeOut : Number;
		
		protected var _ease : Function;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function AlphaEffect(timeIn : Number = 1, timeOut : Number = .5, ease : Function = null)
		{
			_timeIn = timeIn;
			_timeOut = timeOut;
			_ease = ease || Expo.easeOut;
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function apply(asHTML : Boolean = true) : void
		{
			if(asHTML)
			{
				_source.textField.htmlText = _source.content;
			}
			else
			{
				_source.textField.text = _source.content;
			}
			TweenLite.to(_source.textField, _timeIn, { alpha:1, ease:_ease });
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function dispose() : void
		{
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		override public function set text(value : String) : void
		{
			TweenLite.killTweensOf(_source.textField);
			
			if(isEmpty(_source.content))
			{
				_source.textField.alpha = 0;
				apply(false);
			}
			else
			{
				TweenLite.to(_source.textField, _timeOut, { alpha:0, ease:_ease, onComplete:apply, onCompleteParams:[false] });
			}
		}

		override public function set htmlText(value : String) : void
		{
			TweenLite.killTweensOf(_source.textField);
			
			if(isEmpty(_source.content))
			{
				_source.textField.alpha = 0;
				apply(true);
			}
			else
			{
				TweenLite.to(_source.textField, _timeOut, { alpha:0, ease:_ease, onComplete:apply, onCompleteParams:[true] });
			}
		}

		override public function set source(value : BasicText) : void
		{
			super.source = value;
			
			_source.textField.alpha = 0;
			apply(true);
		}

	}
}
