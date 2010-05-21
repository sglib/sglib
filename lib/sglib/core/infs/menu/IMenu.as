package sglib.core.infs.menu
{
	import sglib.core.data.Group;
	import sglib.core.infs.layout.ILayout;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public interface IMenu 
	{
		function get parent()	: IMenuItem;
		function get children()	: Array; /* of menu items */
		function get group()	: Group;
		function set layout()	: ILayout;
	}
	
}