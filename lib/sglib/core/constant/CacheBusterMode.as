package sglib.core.constant 
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public class CacheBusterMode
	{
		public static const NONE	: String = 'NONE'; /* turn off cache buster */
		public static const FIRST	: String = 'FIRST'; /* practical use - prevent cache just the first time */
		public static const ALWAYS	: String = 'ALWAYS'; /* mostly for testing purpose or server ping */
	}

}