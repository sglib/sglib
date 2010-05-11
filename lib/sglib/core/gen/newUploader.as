package sglib.core.gen 
{
	import sglib.core.infs.IUploader;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public function newUploader() : IUploader
	{
		return instantiate('sglib.service.Uploader') as IUploader;
	}	
}