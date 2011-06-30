package com.lucas
{

	import fashion.nugget.view.NuggetView;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class Menu extends NuggetView
	{

		public function Menu()
		{
			this.graphics.beginFill(0x000000);
			this.graphics.drawRect(0, 0, 1000, 50);
		}
			
		override protected function init() : void
		{
			trace(_nugget.id);
		}
	}
}
