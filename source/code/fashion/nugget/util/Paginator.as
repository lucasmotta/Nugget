package fashion.nugget.util
{

	import fashion.nugget.events.PaginatorEvent;
	import fashion.nugget.util.number.limit;

	import flash.events.EventDispatcher;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class Paginator extends EventDispatcher
	{
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		protected var _length : int;

		protected var _page : int;

		protected var _loop : Boolean;


		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Paginator(page : int = 0, length : int = 0, loop : Boolean = false)
		{
			_length = length;
			_loop = loop;
			
			this.page = page;
		}

		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		protected function checkPageDispatch(lastPage : int, newPage : int) : void
		{
			if(_loop) return;
			
			if(newPage == 0)
			{
				if(newPage < lastPage)
				{
					dispatchEvent(new PaginatorEvent(PaginatorEvent.ON_FIRST_PAGE_IN, false, false, this.isFirst, this.isLast));
				}
			}
			else
			{
				if(lastPage == 0)
				{
					dispatchEvent(new PaginatorEvent(PaginatorEvent.ON_FIRST_PAGE_OUT, false, false, this.isFirst, this.isLast));
				}
			}
			if(newPage == _length - 1)
			{
				if(newPage > lastPage)
				{
					dispatchEvent(new PaginatorEvent(PaginatorEvent.ON_LAST_PAGE_IN, false, false, this.isFirst, this.isLast));
				}
			}
			else
			{
				if(lastPage == _length - 1)
				{
					dispatchEvent(new PaginatorEvent(PaginatorEvent.ON_LAST_PAGE_OUT, false, false, this.isFirst, this.isLast));
				}
			}
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function next() : void
		{
			this.page++;
		}

		public function previous() : void
		{
			this.page--;
		}

		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Check if it's on the first page
		 */
		public function get isFirst() : Boolean
		{
			return _page == 0;
		}

		/**
		 * Check if it's on the last page
		 */
		public function get isLast() : Boolean
		{
			return _page == _length - 1;
		}

		/**
		 * Check if there's a next page
		 */
		public function get hasNext() : Boolean
		{
			return _loop ? true : !this.isLast;
		}

		/**
		 * Check if there's a previous page
		 */
		public function get hasPrevious() : Boolean
		{
			return _loop ? true : !this.isFirst;
		}

		/**
		 * Number of pages
		 */
		public function get length() : int
		{
			return _length;
		}

		public function set length(length : int) : void
		{
			_length = length;
		}

		/**
		 * The current page
		 */
		public function get page() : int
		{
			return _page;
		}

		public function set page(value : int) : void
		{
			var lastPage : int = _page;
			
			_page = value;
			_page = _loop ? _page < 0 ? _length - 1 : _page % _length : limit(_page, 0, _length - 1);

			dispatchEvent(new PaginatorEvent(PaginatorEvent.CHANGE, false, false, this.isFirst, this.isLast));
			checkPageDispatch(lastPage, _page);
		}

		/**
		 * Set if the class will loop through the pages when you reach the first or last page.
		 * If you are on the last page and you call the <code>next</code> method, the next page will be the first.
		 */
		public function get loop() : Boolean
		{
			return _loop;
		}

		public function set loop(loop : Boolean) : void
		{
			_loop = loop;
		}
	}
}
