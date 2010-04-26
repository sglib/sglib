package sglib.core.infs.visual 
{
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IVisualSwap extends IVisualEx
	{
		function setViewElements(pview1: IVisualEx, pview2: IVisualEx): IVisualSwap;
	}
	
}