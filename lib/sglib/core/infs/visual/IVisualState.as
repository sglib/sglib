package sglib.core.infs.visual 
{
	import flash.display.DisplayObject;
	import sglib.core.data.State;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface IVisualState extends IVisualObject
	{
		function get state(): State;
		function setContent(ptarget: DisplayObject):IVisualState;
	}
	
}