package com.lucas.test
{

	import fashion.nugget.core.ISectionView;
	import fashion.nugget.view.SectionView;

	import com.greensock.TweenMax;
	import com.greensock.easing.Expo;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class Portfolio extends SectionView implements ISectionView
	{
		
		// ----------------------------------------------------
		// PUBLIC VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED VARIABLES
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// CONSTRUCTOR
		// ----------------------------------------------------
		/**
		 * @constructor
		 */
		public function Portfolio()
		{
			super();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			this.scaleX = 0;
			this.graphics.beginFill(0x0000FF);
			this.graphics.drawRect(0, 0, 1000, 700);
			//
			super.init();
			transitionIn();
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		override public function transitionIn() : void
		{
			TweenMax.to(this, 1, { scaleX:1, ease:Expo.easeInOut, onComplete:super.transitionIn });
		}
		
		override public function transitionOut() : void
		{
			TweenMax.to(this, 1, { scaleX:0, x:this.width, ease:Expo.easeInOut, onComplete:super.transitionOut });
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
