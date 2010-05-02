package sglib.core.utils.display
{
	import flash.display.DisplayObject;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * remove DisplayObjects from its parent
	 * @param	...pchildren DisplayObjects need to be removed from its parents
	 */
	public function removeThis(...pchildren): void 
	{
		var l: int = pchildren.length;
		var child : DisplayObject;
		
		for (var i: int = 0; i < l; i++) {
			child = pchildren[i];
			if (child && child.parent) child.parent.removeChild(child);
		}
	}

}