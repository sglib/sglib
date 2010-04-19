package sglib.core.gen 
{
	import sglib.core.infs.load.ILoaderAudio;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
<<<<<<< HEAD
	 * @update 19 April 2010 (0.1.0)
=======
	 * @update 14 April 2010 (0.1.0)
>>>>>>> 866878cad9ffb6b87d23d0ad7042448c31baf5d1
	 */
	public function newLoaderAudio() : ILoaderAudio
	{
		return instantiate('sglib.service.load.LoaderAudio') as ILoaderAudio;
	}
	
}