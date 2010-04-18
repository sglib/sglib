package sglib.core.utils
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author thienhaflash
	 */
	public function drwRect(tar: DisplayObject, color: int = 0xEAEAEA, w: int = 100, h: int = 100, alpha: Number = 1) : DisplayObject
	{
		var grp : Graphics = (tar is Sprite) ? (tar as Sprite).graphics : (tar as Shape).graphics;
		grp.beginFill(color, alpha);
		grp.drawRect(0, 0, w, h);
		grp.endFill();
		return tar;
	}

}