package sglib.core.infs.visual
{
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface IVisualMedia extends IVisualObject
	{
		function get url(): String;
		function set url(purl: String): void;
		function setUrl(purl: String, pType: int = -1);
		
		function get asGraphic	: IVisualGraphic;
		function get asVideo	: IVisualVideo;
	}
	
}