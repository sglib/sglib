package sglib.core.gen 
{
	import sglib.core.infs.ITask;
	import sglib.core.utils.instantiate;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 09 May 2010 (0.1.0)
	 */
	public function newTask() : ITask
	{
		return instantiate('sglib.service.Task') as ITask;
	}	
}