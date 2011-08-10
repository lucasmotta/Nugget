package fashion.nugget.i18n
{

	import fashion.nugget.events.GlossaryEvent;
	import fashion.nugget.util.string.printf;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class Glossary extends EventDispatcher
	{

		public static const PT_BR : String = "pt-BR";

		public static const EN : String = "en";

		public static const ES : String = "es";

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _locales : Dictionary = new Dictionary();

		protected var _texts : Dictionary = new Dictionary();

		protected var _language : String = Glossary.EN;


		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		/**
		 * Create a new locale
		 */
		public function create(language : String) : Locale
		{
			if (_locales[language] == null)
			{
				_locales[language] = new Locale(language);
			}
			return _locales[language];
		}

		/**
		 * Learn some content to an specific language or to all languages
		 * 
		 * @param content		XML
		 * @param language		Language of your content. If you don't set any language, the content will be learned by all active languages
		 */
		public function learn(content : XML, language : String = null) : void
		{
			var locale : Locale;

			if (language == null)
			{
				for each (locale in _locales)
				{
					locale.learn(content);
				}
			}
			else
			{
				locale = create(language);
				locale.learn(content);
			}
		}

		/**
		 * Add a glossary item (textField) so it can be updated when the language is changed
		 * 
		 * @param item			Glossary Item, containing the textField instance and the key for this text
		 */
		public function add(item : GlossaryItem) : GlossaryItem
		{
			_texts[item] = item;
			return item;
		}

		/**
		 * Remove the glossary item from the library
		 * 
		 * @param item			Glossary Item
		 */
		public function remove(item : GlossaryItem) : void
		{
			_texts[item] = null;
			delete _texts[item];
		}

		/**
		 * Returns the specific content of a given key
		 * 
		 * @param key			Key
		 * @param replace		Extra parameter if you want to replace anything on your key. It' very usefull when you have to set an number/indice on your string.
		 */
		public function spell(key : String, replace : Object = null) : *
		{
			return currentLocale.get(replace == null ? key : printf(key, replace));
		}

		/**
		 * Translate an glossary item to the current language
		 * 
		 * @param item			Glossary Item
		 */
		public function translate(item : GlossaryItem) : void
		{
			item.glossaryText.htmlText = spell(item.key)[0];
		}

		/**
		 * Translate all glossary items to the current language
		 */
		public function translateAll() : void
		{
			for each (var item : GlossaryItem in _texts)
			{
				item.glossaryText.htmlText = currentLocale.get(item.key);
			}
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Set the current language
		 */
		public function set language(value : String) : void
		{
			if (_language == value) return;
			_language = value;

			translateAll();

			this.dispatchEvent(new GlossaryEvent(GlossaryEvent.LANGUAGE_CHANGE));
		}

		public function get language() : String
		{
			return _language;
		}

		/**
		 * Get the current locale
		 */
		public function get currentLocale() : Locale
		{
			return _locales[_language];
		}


		// ----------------------------------------------------
		// SINGLETON
		// ----------------------------------------------------
		private static var _instance : Glossary;


		public static function getInstance() : Glossary
		{
			if (_instance == null)
			{
				_instance = new Glossary();
			}
			return _instance;
		}
	}
}
internal class Locale
{

	// ----------------------------------------------------
	// PRIVATE AND PROTECTED VARIABLES
	// ----------------------------------------------------
	protected var _glossary : XML;

	protected var _language : String;


	// ----------------------------------------------------
	// CONSTRUCTOR
	// ----------------------------------------------------
	/**
	 * @constructor
	 */
	public function Locale(language : String) : void
	{
		_language = language;
		_glossary = <glossary />;
	}

	// ----------------------------------------------------
	// PRIVATE AND PROTECTED METHODS
	// ----------------------------------------------------
	protected function getId(value : String) : int
	{
		var index : int = value.indexOf("#");
		if (index < 0) return -1;

		return parseInt(value.slice(index + 1, value.length));
	}

	protected function getNode(value : String) : String
	{
		var index : int = value.indexOf("@");
		if (index >= 0)
		{
			return value.slice(0, index);
		}
		return value;
	}

	protected function getAttribute(value : String) : String
	{
		var index : int = value.indexOf("@");
		if (index >= 0)
		{
			return value.slice(index + 1, value.length);
		}
		return null;
	}

	// ----------------------------------------------------
	// PUBLIC METHODS
	// ----------------------------------------------------
	public function learn(content : XML) : void
	{
		_glossary.appendChild(content.children());
	}

	public function get(key : String) : *
	{
		var items : Array = key.split(".");
		var xml : * = _glossary.copy();
		var str : String;
		var att : String;
		var id : int;

		for (var i : int; i < items.length; i++)
		{
			str = getNode(items[i]);
			att = getAttribute(items[i]);
			id = getId(str);

			xml = id < 0 ? xml[str] : xml[str.slice(0, str.indexOf("#"))][id];
			if (att)
			{
				return xml.attribute(att);
			}
		}
		return xml;
	}

	// ----------------------------------------------------
	// GETTERS AND SETTERS
	// ----------------------------------------------------
	public function get language() : String
	{
		return _language;
	}

	public function get glossary() : XML
	{
		return _glossary;
	}
}