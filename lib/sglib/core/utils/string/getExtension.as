package sglib.core.utils.string
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public function getExtension(url: String) : String
	{
		return url.slice(url.length - 4, url.length);
	}
}