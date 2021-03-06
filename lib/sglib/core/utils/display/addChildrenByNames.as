﻿package sglib.core.utils.display
{
	import flash.display.DisplayObjectContainer;
	import flash.display.DisplayObject;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * add a list of DisplayObjects into a DisplayObjectContainer
	 * @param	pparent the parent
	 * @param	pnames the name list of DisplayObjects
	 */
	public function addChildrenByNames(pparent: DisplayObject, pnames : Array) : void
	{
		var p : DisplayObjectContainer = pparent as DisplayObjectContainer;
		if (!p) return;
		
		var l : int = names.length;
		for (var i:int = 0; i < l; i++) 
		{
			p.addChild(tar[names[i]]);
		}
		
	}

}