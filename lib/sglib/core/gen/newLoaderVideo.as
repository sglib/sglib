package sglib.core.gen 
{
	import sglib.core.infs.load.ILoaderVideo;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 19 April 2010 (0.1.0)
	 */
	public function newLoaderVideo(): ILoaderVideo
	{
		return instantiate('sglib.service.load.LoaderVideo') as ILoaderVideo;
	}
	
}