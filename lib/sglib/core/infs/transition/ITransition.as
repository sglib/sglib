package sglib.core.infs.transition
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface ITransition 
	{
		function get view(): DisplayObject;
		
		function setBound(pbound : Object): ITransition; /* need .x, .y, .width, .height - can be null */
		function setParent(pparent: DisplayObject): void; /* default parent, can be null */
		
		//function show(pduration: Number = 1, pdelay: Number = 0): void; //better composing effects
		//function hide(pduration: Number = 1, pdelay: Number = 0): void; //better composing effects
		
	}
	
}