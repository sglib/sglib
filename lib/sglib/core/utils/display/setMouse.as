package sglib.core.utils.display
{
	import flash.display.Sprite;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * set mouseEnabled, mouseChildren, buttonMode for Sprites
	 * @param	tars list of sprites need to set mouse
	 * @param	enabled mouseEnabled
	 * @param	button buttonMode
	 * @param	children mouseChildren
	 */
	public function setMouse(tars: Array, enabled: Boolean = true, button: Boolean = true, children: Boolean = false): void 
	{
		if (!tars) return;
		
		var item : Sprite;//consider change to something else
		var l	: int = tars.length;
		
		for (var i:int = 0; i < l; i++) 
		{
			item = tars[i];
			if (item) {
				item.mouseEnabled = enabled;
				item.mouseChildren = children;
				item.buttonMode = button;
			}
		}
	}
}