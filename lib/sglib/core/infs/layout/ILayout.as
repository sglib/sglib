package sglib.core.infs.layout 
{
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface ILayout 
	{
		function refresh(pitems: Array): Object;
		function get width():int;
		function get height(): int;
	}
	
}