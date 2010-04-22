package sglib.core.utils 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public function removeChildren(ptarget: DisplayObject) : void
	{
		var c : DisplayObjectContainer = ptarget as DisplayObjectContainer;
		
		while (c.numChildren > 0) {
			c.removeChildAt(0);
		}
	}
	
}