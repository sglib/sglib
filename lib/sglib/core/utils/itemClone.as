package sglib.core.utils 
{
	import flash.utils.getQualifiedClassName;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public function itemClone(pn: int, psource: Object, pfInit: Function = null, preuse : Boolean = false) : Array
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
		
		for (; i < pn; i++) {
			itm = new cls();
			items.push(itm);
			if (pfInit != null) pfInit(itm, i);
		}
		
		return arr;
	}
	
}
