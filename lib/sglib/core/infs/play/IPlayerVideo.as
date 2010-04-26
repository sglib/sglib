package sglib.core.infs.play
{
	import flash.net.NetStream;
	import sglib.core.infs.load.ILoaderVideo;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IPlayerVideo extends IPlayer
	{
		function get loader(): ILoaderVideo;
	}
	
}