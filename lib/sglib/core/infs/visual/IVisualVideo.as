package sglib.core.infs.visual
{
	import sglib.core.infs.load.ILoaderVideo;
	import sglib.core.infs.play.IPlayerVideo;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface IVisualVideo extends IVisualEx
	{
		function get asLoader(): ILoaderVideo;
		function get asPlayer(): IPlayerVideo;
	}
	
}