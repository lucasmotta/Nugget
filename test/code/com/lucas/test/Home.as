package com.lucas.test
{

	import fashion.nugget.core.ISectionView;
	import fashion.nugget.view.SectionView;

	import com.greensock.TweenMax;
	import com.greensock.easing.Expo;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class Home extends SectionView implements ISectionView
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
		public function Home()
		{
			super();
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			this.scaleY = 0;
			this.graphics.beginFill(0xFF0000);
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
			TweenMax.to(this, 1, { scaleY:1, ease:Expo.easeInOut, onComplete:super.transitionIn });
		}
		
		override public function transitionOut() : void
		{
			TweenMax.to(this, 1, { scaleY:0, y:this.height, ease:Expo.easeInOut, onComplete:super.transitionOut });
		}
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
	}
}
