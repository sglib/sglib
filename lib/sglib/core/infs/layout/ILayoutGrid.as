package sglib.core.infs.layout
{
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface ILayoutGrid extends ILayout
	{
		function config(pw: int, ph: int, pn: int, phorz: Boolean = false, px: int = 0, py: int = 0): ILayoutGrid;
	}
	
}