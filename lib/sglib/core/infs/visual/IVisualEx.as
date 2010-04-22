package sglib.core.infs.visual 
{
	import sglib.core.data.Numeric;
	import sglib.core.infs.load.ILoader;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public interface IVisualEx extends IVisualObject
	{
		function get url(): String;
		function set url(purl: String): void;
		function get loadProgress(): Numeric;
	}
	
}