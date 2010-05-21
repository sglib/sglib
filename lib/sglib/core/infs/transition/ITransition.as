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
		function setBound(pbound : Object): ITransition; /* need .x, .y, .width, .height - can be null */
		function setParent(pparent: DisplayObject): ITransition; /* default parent, can be null */
		function setEase(ease: Function):ITransition;
		function setTime(pduration: Number):ITransition;
		
		function show(ptarget: DisplayObject, pdelay: Number = 0): void; //better composing effects
		function hide(ptarget: DisplayObject, pdelay: Number = 0): void; //better composing effects
	}
	
}