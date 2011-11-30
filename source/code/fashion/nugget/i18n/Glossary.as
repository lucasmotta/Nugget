package fashion.nugget.i18n
{

	import fashion.nugget.events.GlossaryEvent;
	import fashion.nugget.util.string.printf;

	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;


	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * Singleton class where I store on the data, texts and xml's.
	 * You can also use multiple language and change it in real time for all the GlossaryText.
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
		
		protected var _base : XMLList;

		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function loadCurrentLocale() : void
		{
			dispatchEvent(new GlossaryEvent(GlossaryEvent.LOAD_START));
			
			currentLocale.addEventListener(GlossaryEvent.LOAD_COMPLETED, onLoadCompleted);
			currentLocale.load();
		}

		protected function onLoadCompleted(e : GlossaryEvent) : void
		{
			currentLocale.removeEventListener(GlossaryEvent.LOAD_COMPLETED, onLoadCompleted);
			dispatchEvent(new GlossaryEvent(GlossaryEvent.LOAD_COMPLETED));
			
			translateAll();
		}
		
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
				_locales[language] = new Locale(language, _base);
			}
			return _locales[language];
		}

		/**
		 * Learn some content to an specific language or to all languages
		 * 
		 * @param content		XML
		 * @param language		Language of your content. If you don't set any language, the content will be learned by all active languages (usefull for global text's)
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
		 * @param key			Key.
		 						Use # followed by a number to get the a specific node by it's indice. Example: <code>get("node.item#2)</code> will return the third "item" node (because it's starts on 0).;
	 							Use @ followed by any value to get the attribute. Example: <code>get("node.item#2.@color)</code> will return the attribute "color" of the third "item" node;
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
				translate(item);
			}
			dispatchEvent(new GlossaryEvent(GlossaryEvent.TRANSLATE_COMPLETED));
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Get the current locale
		 */
		public function get currentLocale() : Locale
		{
			return _locales[_language];
		}
		
		/**
		 * Set the current language
		 */
		public function set language(value : String) : void
		{
			if (_language == value) return;
			_language = value;

			currentLocale.loaded ? translateAll() : loadCurrentLocale();
			dispatchEvent(new GlossaryEvent(GlossaryEvent.LANGUAGE_CHANGE));
		}

		public function get language() : String
		{
			return _language;
		}

		/**
		 * The basic structure that will be used to load and parse the files for other languages
		 */
		public function get base() : XMLList
		{
			return _base;
		}

		public function set base(base : XMLList) : void
		{
			_base = base;
		}
		
		/**
		 * Get all the locales
		 */
		public function get locales() : Vector.<Locale>
		{
			var l : Vector.<Locale> = new Vector.<Locale>();
			
			for each(var item : Locale in _locales)
			{
				l.push(item);
			}
			return l;
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
		
		public static function get instance() : Glossary
		{
			return Glossary.getInstance();
		}

	}
}

import fashion.nugget.Nugget;
import fashion.nugget.events.GlossaryEvent;
import fashion.nugget.util.string.printf;

import com.greensock.events.LoaderEvent;
import com.greensock.loading.LoaderMax;
import com.greensock.loading.XMLLoader;

import flash.events.EventDispatcher;

internal class Locale extends EventDispatcher
{

	// ----------------------------------------------------
	// PRIVATE AND PROTECTED VARIABLES
	// ----------------------------------------------------
	protected var _glossary : XML;
	
	protected var _base : XMLList;

	protected var _language : String;
	
	
	protected var _queue : LoaderMax;
	
	protected var _loaded : Boolean;


	// ----------------------------------------------------
	// CONSTRUCTOR
	// ----------------------------------------------------
	/**
	 * @constructor
	 */
	public function Locale(language : String, base : XMLList) : void
	{
		_language = language;
		_base = base;
		_glossary = <glossary />;
		
		setupLoader();
	}

	// ----------------------------------------------------
	// PRIVATE AND PROTECTED METHODS
	// ----------------------------------------------------
	protected function setupLoader() : void
	{
		var i : int;
		var length : int = _base.length();
		var file : String;
		
		_queue = new LoaderMax({ onComplete:onQueueLoadCompleted });
		
		for(i = 0; i < length; i++)
		{
			file = printf(_base[i].@url, { basepath:Nugget.basepath, language:_language });
			_queue.append(new XMLLoader(file, { onComplete:onChildLoadCompleted }));
		}
	}
	
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
	// EVENT HANDLERS
	// ----------------------------------------------------
	protected function onChildLoadCompleted(e : LoaderEvent) : void
	{
		learn(new XML(e.target["content"]));
	}
	
	protected function onQueueLoadCompleted(e : LoaderEvent) : void
	{
		_loaded = true;
		dispatchEvent(new GlossaryEvent(GlossaryEvent.LOAD_COMPLETED));
	}

	// ----------------------------------------------------
	// PUBLIC METHODS
	// ----------------------------------------------------
	public function load() : Boolean
	{
		if(_loaded) return false;
		_queue.load();
		return true;
	}
	
	public function learn(content : XML) : void
	{
		_glossary.appendChild(content.children());
	}
	
	/**
	 * Use # followed by a number to get the a specific node by it's indice. Example: <code>get("node.item#2)</code> will return the third "item" node (because it's starts on 0).;
	 * Use @ followed by any value to get the attribute. Example: <code>get("node.item#2.@color)</code> will return the attribute "color" of the third "item" node;
	 */
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

	public function get queue() : LoaderMax
	{
		return _queue;
	}

	public function get loaded() : Boolean
	{
		return _loaded;
	}
}