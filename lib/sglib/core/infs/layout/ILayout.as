package sglib.core.infs.layout 
{
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface ILayout 
	{
		function refresh(pitems: Array): void;
		function get width():int;
		function get height(): int;
	}
	
}