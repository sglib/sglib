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
	 * get the children of a DisplayObjectContainer by names
	 * @param	pparent the DisplayObjectContainer
	 * @param	pnames Array of the children's pnames
	 * @return
	 */
	public function getChildrenByNames(pparent : DisplayObject, pnames : Array) : Array
	{
		var arr : Array = [];
		var p	: DisplayObjectContainer = pparent as DisplayObjectContainer;
		if (!p) return arr;
		
		var n	: int = p.numChildren;
		
		for (var i:int = 0; i < n; i++) 
		{
			try {//we can't use .getChildrenByName here because they can be removed from the displaylist somewhere
				arr.push(p[pnames[i]]);
			} catch (e: Error) {}
		}
		
		return arr;
	}

}