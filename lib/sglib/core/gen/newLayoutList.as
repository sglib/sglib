package sglib.core.gen 
{
	import sglib.core.infs.layout.ILayoutList;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.1
	 * @author thienhaflash (thienhaflash@gmail.com)
	 *  @update 05 May 2010 (0.1.1)
	 * 		Added support for parameters on instantiate
	 */
	public function newLayoutList(pgap: int = 0, phorz: Boolean = true, px : int = 0, py: int = 0) : ILayoutList
	{
		var li : ILayoutList = instantiate('sglib.service.layout.LayoutList') as ILayoutList;
		li.config(pgap, phorz, px, py);
		return li;
	}
	
}