package sglib.core.constant 
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public class UploaderInfo
	{
		public static const BROWSE 			: String = 'BROWSE';
		public static const LIST_CHANGED 	: String = 'LIST_CHANGED';
		
		public static const FILE_DUPLICATE  : String = 'FILE_DUPLICATE';//file is already in the list
		public static const FILE_INVALID	: String = 'FILE_INVALID';//file is not match extension / filesize limit
		
		public static const FILE_START	 	: String = 'FILE_START';
		public static const FILE_COMPLETE 	: String = 'FILE_COMPLETE';
		public static const FILE_ERROR	 	: String = 'FILE_ERROR';
		public static const ALL_COMPLETE 	: String = 'ALL_COMPLETE';
	}

}