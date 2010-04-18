package sglib.core.infs 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface ITransition 
	{
		function get view(): DisplayObject;
		
		function setBound(pbound : Object): ITransition; /* need .x, .y, .width, .height - can be null */
		function setParent(pparent: Sprite): void; /* default parent, can be null */
		
		function addIn(ptarget: DisplayObject, pTime: * = null, pConfig: * = null): ITransition;
		function addOut(ptarget: DisplayObject, pTime: * = null, pConfig: * = null):ITransition;
		
		function start(): void;
		function stop(): void;
	}
	
}