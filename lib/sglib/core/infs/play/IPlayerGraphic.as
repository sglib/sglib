package sglib.core.infs.play
{
	import sglib.core.infs.load.ILoaderGraphic;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IPlayerGraphic extends IPlayer
	{
		function get loader():ILoaderGraphic;
	}
	
}