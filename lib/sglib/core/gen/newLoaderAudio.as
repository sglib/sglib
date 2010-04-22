package sglib.core.gen 
{
	import sglib.core.infs.load.ILoaderAudio;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * @update 19 April 2010 (0.1.0)
	 */
	public function newLoaderAudio() : ILoaderAudio
	{
		return instantiate('sglib.service.load.LoaderAudio') as ILoaderAudio;
	}
	
}