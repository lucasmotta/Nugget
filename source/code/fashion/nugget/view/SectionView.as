package fashion.nugget.view
{

	import fashion.nugget.core.IDependencies;
	import fashion.nugget.core.ISectionView;
	import fashion.nugget.events.SectionEvent;

	import flash.events.Event;

	/**
	 * @author Lucas Motta - http://lucasmotta.com
	 * 
	 * The SectionView has implemented the transitions and the dependencies of this section
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

		// ----------------------------------------------------
		// EVENT HANDLERS
		// ----------------------------------------------------
		override protected function onAddedToStage(e : Event) : void
		{
			super.onAddedToStage(e);
			
			transitionIn();
		}
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
		 * Section Dependencies
		 */
		public function get dependencies() : IDependencies
		{
			return this.nugget.loader.dependencies;
		}
	}
}
