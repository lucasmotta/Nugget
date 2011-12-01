package fashion.nugget
{

	import fashion.nugget.core.INugget;

	/**
	 * @author Lucas Motta
	 */
	public function nggt(id : String) : INugget
	{
		return NuggetLibrary.get(id);
	}
}
