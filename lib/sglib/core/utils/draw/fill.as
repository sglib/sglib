package sglib.core.utils.draw
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
	 * shortcut to beginFill
	 * @param	pdo the displayobject
	 * @param	pcolor the color to be filled
	 * @param	palpha the alpha
	 * @return
	 */
	public function fill(pdo: DisplayObject, pcolor: int = 0xEAEAEA, palpha: Number = 1) : Graphics
	{
		var graphics : Graphics = (pdo is Shape) ? (pdo as Shape).graphics : (pdo as Sprite).graphics;
		graphics.beginFill(pcolor, palpha);
		return graphics;
	}
}