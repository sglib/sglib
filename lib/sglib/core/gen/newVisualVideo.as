package sglib.core.gen 
{
	import sglib.core.infs.visual.IVisualVideo;
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
	public function newVisualVideo() : IVisualVideo
	{
		return instantiate('sglib.display.base.VisualVideo') as IVisualVideo;
	}
}