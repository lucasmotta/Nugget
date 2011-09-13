package fashion.nugget.events
{

	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class PaginatorEvent extends Event
	{

		public static const CHANGE : String = "change";

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
