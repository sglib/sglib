package sglib.core.utils.display
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * remove all the children of a DisplayObjectContainer
	 * @param	pparent should be DisplayObjectContainer, declared as DisplayObject to minimize type casting typing
	 * @param	pignoreChildren names of the children to be ignore (not remove)
	 */
	public function removeChildren(pparent: DisplayObject, pignoreChildren: Array = null) : void
	{
		if (!pparent) return;
		
		var hld : DisplayObjectContainer = pparent as DisplayObjectContainer;
		//TODO : implement ignoreChildren exclusion
		while (hld.numChildren >0 ) {
			hld.removeChildAt(0);
		}
		
	}
}