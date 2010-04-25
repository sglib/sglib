package sglib.core.infs.comp 
{
	import sglib.core.data.Numeric;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface IProgress extends IComponent
	{
		function setProgress(pvalue: Numeric):IProgress;
	}
	
}