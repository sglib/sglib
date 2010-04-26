package sglib.core.constant 
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class PlayStatus
	{
		public static const PLAY	: String = 'PLAY';
		public static const PAUSE	: String = 'PAUSE';
		public static const BUFFER	: String = 'BUFFER'; /* playing, but auto-paused by not enough buffering */
		public static const STOP	: String = 'STOP'; /* stop at the begining / unload */
		public static const END		: String = 'END'; /* stop at the end */
	}
}