package sglib.core.infs.visual 
{
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 19 April 2010 (0.1.0)
	 */
	public interface IVisualSwap extends IVisualEx
	{
		function setViewElements(pview1: IVisualEx, pview2: IVisualEx): IVisualSwap;
	}
	
}