package sglib.core.infs.play
{
	import sglib.core.infs.load.ILoaderAudio;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface IPlayerAudio extends IPlayer
	{
		function get loader():ILoaderAudio;
	}
	
}