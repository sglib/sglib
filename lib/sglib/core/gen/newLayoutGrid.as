package sglib.core.gen 
{
	import sglib.core.infs.layout.ILayoutGrid;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.1
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.1)
	 * 		Added support for parameters on instantiate
	 * 
	 */
	public function newLayoutGrid(pw: int, ph: int, pn: int, phorz: Boolean = false, px: int = 0, py: int = 0) : ILayoutGrid
	{
		var lg : ILayoutGrid = instantiate('sglib.service.layout.LayoutGrid') as ILayoutGrid;
		lg.config(pw, ph, pn, phorz, px, py);
		return lg;
	}
	
}