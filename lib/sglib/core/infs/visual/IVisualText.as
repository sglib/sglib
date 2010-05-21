package sglib.core.infs.visual 
{
	import flash.display.DisplayObject;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 14 May 2010 (0.1.0)
	 */
	public interface IVisualText extends IVisualObject
	{
		function setHLColor(pcolor: int):IVisualText;		
		function highlight(preg: RegExp): IVisualText;
		function highlightText(ptext: String, pcase: Boolean):IVisualText;
		function highlightPosition(pstart: int, pend: int):IVisualText;
		function clearHighlight():IVisualText;
	}
	
}