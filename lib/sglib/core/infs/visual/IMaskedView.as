package sglib.core.infs.visual
{
	import flash.display.DisplayObject;
	import sglib.core.data.Numeric;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface IMaskedView extends IVisualObject
	{
		function get hzPosition(): Numeric;
		function get hzRelation(): Numeric;
		function get vtPosition(): Numeric;
		function get vtRelation(): Numeric;
		
		function setContent(pcontent: DisplayObject): IMaskedView;
		function setVisualContent(pcontent: IVisualObject): IMaskedView;
		function setSize(pwidth: int, pheight: int): IMaskedView;
	}
	
}