package sglib.core.gen 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * Create a new bitmap / reuse the existed bitmap as snapshot of the source, honors the source's transform matrix
	 * @param	pwidth width of the desired bitmapData
	 * @param	pheight height of the desired bitmapData
	 * @param	psource the source that will be shot
	 * @param	poldBitmap the old Bitmap to be reused if applicable
	 * @return
	 */
	public function newBitmap(pwidth: int, pheight: int, psource: DisplayObject, poldBitmap: Bitmap = null): Bitmap  
	{
		var bmd : BitmapData = (poldBitmap && poldBitmap.bitmapData.width == pwidth && poldBitmap.bitmapData.height == pheight) ? poldBitmap.bitmapData : new BitmapData(pwidth, pheight);
		
		var om : Matrix = psource.transform.matrix;
		psource.width = pwidth;
		psource.height = pheight;
		psource.x = 0;
		psource.y = 0;
		bmd.draw(psource, psource.transform.matrix, null, null, null, true);
		psource.transform.matrix = om;
		
		if (!poldBitmap) poldBitmap = new Bitmap(bmd);
		return poldBitmap;
	}
}