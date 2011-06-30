package fashion.nugget.text
{

	import fashion.nugget.core.IDisposable;
	import fashion.nugget.core.IGlossaryText;
	import fashion.nugget.events.GlossaryEvent;
	import fashion.nugget.i18n.GlossaryItem;
	import fashion.nugget.i18n.addToGlossary;
	import fashion.nugget.i18n.removeFromGlossary;
	import fashion.nugget.i18n.spell;

	import flash.text.StyleSheet;
	import flash.text.TextFormat;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class GlossaryText extends BasicText implements IGlossaryText, IDisposable
	{

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _glossaryItem : GlossaryItem;
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function GlossaryText(key : String, format : TextFormat = null, css : StyleSheet = null)
		{
			_glossaryItem = addToGlossary(new GlossaryItem(this, key));
			_content = spell(_glossaryItem.key);

			super(_content, format, css);
		}

		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function dispose() : void
		{
			removeFromGlossary(_glossaryItem);
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		override public function set htmlText(value : String) : void
		{
			super.htmlText = value;
			dispatchEvent(new GlossaryEvent(GlossaryEvent.TEXT_CHANGE));
		}

		override public function set text(value : String) : void
		{
			super.text = value;
			dispatchEvent(new GlossaryEvent(GlossaryEvent.TEXT_CHANGE));
		}
		
		/**
		 * Set the glossary key
		 */
		public function set key(value : String) : void
		{
			_glossaryItem.key = value;
			this.htmlText = spell(value);
		}

	}
}
