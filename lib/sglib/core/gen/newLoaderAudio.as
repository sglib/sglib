package sglib.core.gen 
{
	import sglib.core.infs.load.ILoaderAudio;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public function newLoaderAudio() : ILoaderAudio
	{
		return instantiate('sglib.service.load.LoaderAudio') as ILoaderAudio;
	}
	
}