package sglib.core.infs.visual
{
	import sglib.core.data.Group;
	import sglib.core.infs.layout.ILayout;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface IVisualGroup extends IVisualObject
	{
		function setContent(pchildren: Array): IVisualGroup;
		function setLayout(playout: ILayout): IVisualGroup;
		function get group(): Group;
	}
	
}