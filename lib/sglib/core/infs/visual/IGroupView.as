package sglib.core.infs.visual
{
	import sglib.core.infs.layout.ILayout;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface IGroupView extends IVisualObject
	{
		function setContent(...pchildren): IGroupView;
		function generateContent(nChild : int, fInit: Function): IGroupView;
		function setLayout(playout: ILayout): IGroupView;
	}
	
}