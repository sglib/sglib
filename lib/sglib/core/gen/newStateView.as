package sglib.core.gen 
{
	import sglib.core.infs.visual.IStateView;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public function newStateView() : IStateView
	{
		return instantiate('sglib.display.base.StateView') as IStateView;
	}
	
}