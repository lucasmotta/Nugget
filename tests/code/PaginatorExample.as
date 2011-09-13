package
{

	import flash.events.MouseEvent;
	import fashion.nugget.util.Paginator;
	import fashion.nugget.view.View;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	[SWF(backgroundColor="#FFFFFF", frameRate="31", width="1000", height="700")]
	public class PaginatorExample extends View
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		private var _paginator : Paginator;
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function PaginatorExample()
		{
			
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			_paginator = new Paginator(0, 11, true);
			stage.addEventListener(MouseEvent.CLICK, onStageClick);
		}

		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		protected function onStageClick(e : MouseEvent) : void
		{
			mouseX < 1000 * .5 ? _paginator.previous() : _paginator.next();
			trace(_paginator.page);
		}
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
