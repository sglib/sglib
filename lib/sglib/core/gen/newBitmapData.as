package sglib.core.gen 
{
	import flash.display.BitmapData;
	import flash.display.IBitmapDrawable;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * create a new /reuse existed BitmapData to shot an IBitmapDrawable source
	 * @param	pwidth width of the desired bitmapData
	 * @param	pheight height of the desired bitmapData
	 * @param	psource the source that will be shot
	 * @param	poldBmd the old BitmapData to be reused if applicable
	 * @return
	 */
	public function newBitmapData(pwidth: int, pheight: int, psource: IBitmapDrawable, poldBmd: BitmapData = null): BitmapData 
	{
		if (!poldBmd || poldBmd.width != pwidth || poldBmd.height != pheight) {
			poldBmd = new BitmapData(pwidth, pheight, true, 0x00ffffff);
		}
		poldBmd.draw(psource, null, null, null, null, true);
		return poldBmd;
	}
}