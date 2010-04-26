﻿package sglib.core.gen 
{
	import sglib.core.infs.layout.ILayoutList;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public function newLayoutList() : ILayoutList
	{
		return instantiate('sglib.service.layout.LayoutList') as ILayoutList;
	}
	
}