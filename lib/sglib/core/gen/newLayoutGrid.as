package sglib.core.gen 
{
	import sglib.core.infs.layout.ILayoutGrid;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 19 April 2010 (0.1.0)
	 */
	public function newLayoutGrid() : ILayoutGrid
	{
		return instantiate('sglib.service.layout.LayoutGrid') as ILayoutGrid;
	}
	
}