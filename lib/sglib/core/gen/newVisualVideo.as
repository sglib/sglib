package sglib.core.gen 
{
	import sglib.core.infs.visual.IVisualVideo;
	import sglib.core.utils.instantiate;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public function newVisualVideo() : IVisualVideo
	{
		return instantiate('sglib.display.base.VisualVideo') as IVisualVideo;
	}
}