package sglib.core.infs.load 
{
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public interface ICacheBuster 
	{
		/**
		 * change the CacheBuster mode
		 */
		function set mode(pvalue: String):void;
		
		/**
		 * parse the base url based on the CacheBuster mode
		 * @param	purl the base url
		 * @return the real url that we will send request to
		 */
		function fromURL(purl: String): String;
	}
	
}