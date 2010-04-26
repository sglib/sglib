package sglib.core.infs.comp 
{
	import sglib.core.data.Numeric;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IProgress extends IComponent
	{
		function setProgress(pvalue: Numeric):IProgress;
		
		function get seekable():Boolean;
		
		function set seekable(value:Boolean):void;
		
	}
	
}