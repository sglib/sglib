package sglib.core.infs.visual
{
	import sglib.core.infs.load.ILoaderGraphic;
	import sglib.core.infs.play.IPlayerGraphic;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface IVisualGraphic extends IVisualObject
	{
		function get asLoader(): ILoaderGraphic;
		function get asPlayer(): IPlayerGraphic;
		
		function get url(): String;
		function set url(purl: String): void;
	}
	
}