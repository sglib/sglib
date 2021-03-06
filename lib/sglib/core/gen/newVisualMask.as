﻿package sglib.core.gen 
{
	import sglib.core.infs.visual.IVisualMask;
	import sglib.core.utils.instantiate;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public function newVisualMask (): IVisualMask
	{
		return instantiate('sglib.display.base.VisualMask') as IVisualMask;
	}
	
}