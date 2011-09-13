package fashion.nugget.events
{

	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class PaginatorEvent extends Event
	{

		public static const CHANGE : String = "change";
		
		public static const ON_FIRST_PAGE_IN : String = "firstPageIn";

		public static const ON_FIRST_PAGE_OUT : String = "firstPageOut";

		public static const ON_LAST_PAGE_IN : String = "lastPageIn";

		public static const ON_LAST_PAGE_OUT : String = "lastPageOut";
		
		

		protected var _isFirst : Boolean;

		protected var _isLast : Boolean;
		
		public function PaginatorEvent(type : String, bubbles : Boolean = false, cancelable : Boolean = false, isFirstPage : Boolean = false, isLastPage : Boolean = false)
		{
			_isFirst = isFirstPage;
			_isLast = isLastPage;
			
			super(type, bubbles, cancelable);
		}

		public function get isFirst() : Boolean
		{
			return _isFirst;
		}

		public function get isLast() : Boolean
		{
			return _isLast;
		}
	}
}
