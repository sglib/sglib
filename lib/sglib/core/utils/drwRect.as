package sglib.core.utils
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * draw a rectangle into a DisplayObject's graphics
	 * @param	ptarget the DisplayObject who graphics to be drawn
	 * @param	pcolor the color to be drawn
	 * @param	pwidth the desired width
	 * @param	pheight the desired height
	 * @param	palpha the drawing alpha
	 * @return
	 */
	public function drwRect(ptarget: DisplayObject, pcolor: int = 0xEAEAEA, pwidth: int = 100, pheight: int = 100, palpha: Number = 1) : DisplayObject
	{
		var grp : Graphics = (ptarget is Sprite) ? (ptarget as Sprite).graphics : (ptarget as Shape).graphics;
		grp.beginFill(pcolor, palpha);
		grp.drawRect(0, 0, pwidth, pheight);
		grp.endFill();
		return ptarget;
	}

}