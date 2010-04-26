package sglib.core.infs.visual 
{
	import flash.display.DisplayObject;
	import sglib.core.data.State;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IVisualState extends IVisualObject
	{
		function get state(): State;
		function setContent(ptarget: DisplayObject):IVisualState;
	}
	
}