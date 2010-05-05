package sglib.core.gen 
{
	import sglib.core.infs.load.ICacheBuster;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public function newCacheBuster(): ICacheBuster
	{
		return instantiate('sglib.service.load.CacheBuster') as ICacheBuster;
	}	
}