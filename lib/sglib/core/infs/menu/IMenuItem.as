package sglib.core.infs.menu
{
	import sglib.core.data.State;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public interface IMenuItem 
	{
		//function get mouseStatus(): State; /* over / out / down / up */
		function get status(): State; /* non-active / disable / active */
		function get isOpen(): Boolean; /* showing children or not */
		function get parent(): IMenu;
		function get child(): IMenu;
	}
	
}