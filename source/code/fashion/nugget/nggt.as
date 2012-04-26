package fashion.nugget
{

	import fashion.nugget.core.INugget;

	/**
	 * Return a nugget application.
	 * 
	 * @param id			Id of your application. If the id is null, the default application will be used.
	 */
	public function nggt(id : String = null) : INugget
	{
		if(id == null)
		{
			for(var s : String in NuggetLibrary.library)
			{
				return NuggetLibrary.library[s];
			}
		}
		return NuggetLibrary.get(id);
	}
}
