package sglib.core.infs.visual 
{
	import sglib.core.data.Group;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IVisualLimit extends IVisualObject
	{
		function setContent(pchildren: Array): IVisualGroup;
		function setStates(pStates: Array): void;
		function get group(): Group;
	}
	
}