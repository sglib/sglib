package sglib.core.infs.visual
{
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IVisualMedia extends IVisualEx
	{
		function setUrl(purl: String, pType: int = -1);	
		function get asGraphic	: IVisualGraphic;
		function get asVideo	: IVisualVideo;
	}
	
}