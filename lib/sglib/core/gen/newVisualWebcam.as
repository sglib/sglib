package sglib.core.gen 
{
	import sglib.core.infs.visual.IVisualWebcam;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public function newVisualWebcam() : IVisualWebcam
	{
		return instantiate('sglib.display.base.VisualWebcam') as IVisualWebcam;
	}	
}