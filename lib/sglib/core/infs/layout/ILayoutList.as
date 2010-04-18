package sglib.core.infs.layout
{
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface ILayoutList extends ILayout
	{
		function config(pgap: int = 0, phorz: Boolean = true, px : int = 0, py: int = 0): ILayoutList;
	}
	
}