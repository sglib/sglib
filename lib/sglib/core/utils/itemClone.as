package sglib.core.utils 
{
	import flash.utils.getQualifiedClassName;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * generate nItems by cloning from a sample Object
	 * @param	pnItems number of items to be generated
	 * @param	psource the sampling Object (should always have a linked name)
	 * @param	pfInit the function to be called, should be in the form of fInit(obj: Object, id: int): Object
	 * @param	preuse use the sampling Object as the first item or not
	 * @return
	 */
	public function itemClone(pnItems: int, psource: Object, pfInit: Function = null, preuse : Boolean = false) : Array
	{
		var arr	: Array = [];
		var cls : Class = psource.constructor as Class;
		var i	: int;
		
		if (getQualifiedClassName(itm) == 'flash.display.MovieClip') trace(this, 'Warning :: You havent assigned a linkage name for ', itm.name, ' so items are not cloned correctly ! ');
			
		if (preuse) {
			i = 1;
			arr.push(psource);
			if (pfInit != null) pfInit(psource, 0); 		
		}
		
		for (; i < pnItems; i++) {
			itm = new cls();
			items.push(itm);
			if (pfInit != null) pfInit(itm, i);
		}
		
		return arr;
	}
	
}
