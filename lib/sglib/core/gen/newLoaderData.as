package sglib.core.gen 
{
	import sglib.core.infs.load.ILoaderData;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public function newLoaderData(): ILoaderData 
	{
		return instantiate('sglib.service.load.LoaderData') as ILoaderData;
	}	
}