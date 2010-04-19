package sglib.core.gen 
{
	import sglib.core.infs.load.ILoaderGraphic;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public function newLoaderGraphic() : ILoaderGraphic
	{
		return instantiate('sglib.service.load.LoaderGraphic') as ILoaderGraphic;
	}
	
}