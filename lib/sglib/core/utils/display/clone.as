package sglib.core.utils.display
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 02 May 2010 (0.1.0)
	 */
	
	/**
	 * clone a DisplayObject/Bitmap by using its constructor
	 * @param	pdo the displayObject to be cloned
	 * @param	pcloneBmd clone the bitmapData (true) or not (false)
	 * @return
	 */
	public function clone(pdo: DisplayObject, pcloneBmd: Boolean = false): DisplayObject 
	{
		if (pdo is Bitmap) {
			var oBmd : BitmapData = (pdo as Bitmap).bitmapData;
			var bmd : BitmapData = oBmd;
			if (pcloneBmd) {
				bmd = new BitmapData(oBmd.width, oBmd.height, oBmd.transparent);
				bmd.copyPixels(oBmd, new Rectangle(0, 0, oBmd.width, oBmd.height), new Point(0, 0));
			}
			pdo = new Bitmap(bmd);
		} else {
			var cls : Class = (pdo as Object).constructor as Class;
			if (getQualifiedClassName(pdo) == 'flash.display.MovieClip') trace(this, " can't clone a Movieclip");
			pdo = new cls() as DisplayObject;
		}
		
		return pdo;
	}
	
}