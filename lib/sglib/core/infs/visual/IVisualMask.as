package sglib.core.infs.visual
{
	import flash.display.DisplayObject;
	import sglib.core.data.Numeric;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IVisualMask extends IVisualObject
	{
		function get hzPosition(): Numeric;
		function get hzRelation(): Numeric;
		function get vtPosition(): Numeric;
		function get vtRelation(): Numeric;
		
		function setContent(pcontent: DisplayObject): IVisualMask;
		function setVisualContent(pcontent: IVisualObject): IVisualMask;
		function setSize(pwidth: int, pheight: int): IVisualMask;
	}
	
}