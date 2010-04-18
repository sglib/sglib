package sglib.core.infs.comp 
{
	import flash.display.DisplayObject;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface ISkin 
	{
		function set view(pview: DisplayObject):void;
		function get view(): DisplayObject;
		function setSize(pw: int, ph: int):void;
		function get width(): int;
		function get height(): int;
	}
	
}