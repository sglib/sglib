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
	 * get the children from a DisplayObject container from topdown or bottom up
	 * @param	pparent should be DisplayObjectContainer but it's DO here to minimize type casting
	 * @param	ptopdown get the children from top down or bottom up
	 * @return array of the children got
	 */
	public function getChildren(pparent: DisplayObject, ptopdown: Boolean = false): Array
	{
		var arr  : Array = [];
		if (!pparent) return arr;/* return an empty array instead of return null to prevent errors while accessing .length */
		
		var p : DisplayObjectContainer = pparent as DisplayObjectContainer;
		var n : int = container.numChildren;
		
		for (var i: int = 0; i < n; i++) {
			arr.push( (ptopdown) ? p.getChildAt(n - i - 1) : p.getChildAt(i) );
		}
		return arr;
	}

}