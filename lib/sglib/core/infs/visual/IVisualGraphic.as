package sglib.core.infs.visual
{
	import sglib.core.infs.load.ILoaderGraphic;
	import sglib.core.infs.play.IPlayerGraphic;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IVisualGraphic extends IVisualEx
	{
		function get asLoader(): ILoaderGraphic;
		function get asPlayer(): IPlayerGraphic;
	}
	
}