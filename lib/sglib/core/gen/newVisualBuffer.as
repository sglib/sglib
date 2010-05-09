package sglib.core.gen 
{
	import sglib.core.infs.visual.IVisualBuffer;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public function newVisualBuffer() : IVisualBuffer
	{
		return instantiate('sglib.display.base.VisualBuffer') as IVisualBuffer;
	}	
}