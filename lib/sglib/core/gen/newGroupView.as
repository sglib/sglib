﻿package sglib.core.gen 
{
	import sglib.core.infs.visual.IGroupView;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * @update 19 April 2010 (0.1.0)
	 */
	public function newGroupView() : IGroupView
	{
		return instantiate('sglib.display.base.GroupView') as IGroupView;
	}
	
}