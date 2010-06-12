package sglib.core.infs.visual 
{
	import sglib.core.data.Group;
	import sglib.core.data.Numeric;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public interface IVisualBuffer extends IVisualObject
	{
		function set position(pvalue: Numeric):void;
		function set total(value:int):void 
		function setConfig(pitems:Array, ptotal: int, pmodify:Function, pnView: int = -1):void;
		function getPos(addL: Number = 0): Number;
	}
	
}