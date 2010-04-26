package sglib.core.infs.layout
{
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface ILayoutList extends ILayout
	{
		function config(pgap: int = 0, phorz: Boolean = true, px : int = 0, py: int = 0): ILayoutList;
	}
	
}