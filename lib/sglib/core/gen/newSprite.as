package sglib.core.gen 
{
	import ami.helper.copyObj;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public function newSprite(p: DisplayObject = null, props: Object = null) : Sprite
	{
		var sprt : Sprite = new Sprite();
		if (p) (p as DisplayObjectContainer).addChild(sprt);
		if (props) copyObj(sprt, props);
		return sprt;
	}
}