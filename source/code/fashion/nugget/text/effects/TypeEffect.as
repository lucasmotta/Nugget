package fashion.nugget.text.effects
{

	import fashion.nugget.core.ITextEffect;
	import fashion.nugget.motion.SleekTween;
	import fashion.nugget.text.BasicText;

	import com.greensock.TweenMax;

	import flash.text.TextField;
	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class TypeEffect implements ITextEffect
	{

		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _source : BasicText;

		protected var _reference : TextField;

		protected var _anim : TextAnim;

		protected var _previousAnim : TextAnim;

		protected var _reverse : Boolean;

		protected var _oldTextColor : String;

		protected var _timeScale : Number;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function TypeEffect(reverse : Boolean = false, oldTextColor : Number = undefined, timeScale : Number = 1)
		{
			_reverse = reverse;
			_oldTextColor = Boolean(oldTextColor) ? "#" + oldTextColor.toString(16) : null;
			_timeScale = timeScale;

			_reference = new TextField();
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function apply() : void
		{
			if (_oldTextColor)
			{
				_source.textField.htmlText = _previousAnim ? _anim.content + "<font color='" + _oldTextColor + "'>" + _previousAnim.content + "</font>" : _anim.content;
			}
			else
			{
				_source.textField.htmlText = _previousAnim ? _anim.content + _previousAnim.content : _anim.content;
			}
		}

		protected function animationCompleted() : void
		{
			_source.textField.htmlText = _source.content;
		}

		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function dispose() : void
		{
			if (_anim)
			{
				TweenMax.killTweensOf(_anim);
				_anim = null;
			}
			if (_previousAnim)
			{
				TweenMax.killTweensOf(_previousAnim);
				_previousAnim = null;
			}
			if (_reference)
			{
				_reference = null;
			}
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		public function set text(value : String) : void
		{
			if (_anim)
			{
				_previousAnim = _anim;
				_previousAnim.reverse = true;
				SleekTween.to(_anim, .7 * _timeScale, { progress:0 });
			}
			_reference.htmlText = value;
			value = _reference.text;

			_anim = new TextAnim(value);
			_anim.reverse = _reverse;
			SleekTween.to(_anim, .7 * _timeScale, { progress:1, onUpdate:apply, onComplete:animationCompleted });
		}

		public function set source(value : BasicText) : void
		{
			_source = value;

			_source.textField.text = "";
			this.text = _source.content;
		}
	}
}
internal class TextAnim
{

	protected var _value : String;

	protected var _length : int;

	protected var _progress : Number;

	protected var _content : String;

	protected var _reverse : Boolean;


	public function TextAnim(value : String)
	{
		_value = value;
		_length = value.length;
		_progress = 0;
		_content = "";
	}

	protected function apply() : void
	{
		if (_reverse)
		{
			_content = _value.slice(_length - Math.round(_progress * _length), _length);
		}
		else
		{
			_content = _value.slice(0, Math.round(_progress * _length));
		}
	}

	public function get content() : String
	{
		return _content;
	}

	public function set reverse(value : Boolean) : void
	{
		_reverse = value;
	}

	public function get reverse() : Boolean
	{
		return _reverse;
	}

	public function set progress(value : Number) : void
	{
		_progress = value;
		apply();
	}

	public function get progress() : Number
	{
		return _progress;
	}
}
