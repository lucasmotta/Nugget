package fashion.nugget.view
{

	import fashion.nugget.events.SectionEvent;
	import fashion.nugget.core.ISectionView;
	import fashion.nugget.loader.Dependencies;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 */
	public class SectionView extends NuggetView implements ISectionView
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
		public function SectionView()
		{
			
		}
		
		// ----------------------------------------------------
		// PRIVATE AND PROTECTED METHODS
		// ----------------------------------------------------
		override protected function init() : void
		{
			
		}
		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		
		// ----------------------------------------------------
		// PUBLIC METHODS
		// ----------------------------------------------------
		public function transitionIn() : void
		{
			transitionInComplete();
		}
		
		public function transitionInComplete() : void
		{
			
		}
		
		public function transitionOut() : void
		{
			transitionOutComplete();
		}
		
		public function transitionOutComplete() : void
		{
			dispose();
			
			this.dispatchEvent(new SectionEvent(SectionEvent.CLOSED));
		}
		
		// ----------------------------------------------------
		// GETTERS AND SETTERS
		// ----------------------------------------------------
		/**
		 * Dependencies
		 */
		public function get dependencies() : Dependencies
		{
			return this.nugget.loader.dependencies;
		}
		
	}
}
