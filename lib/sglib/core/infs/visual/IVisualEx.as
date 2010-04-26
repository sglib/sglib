package sglib.core.infs.visual 
{
	import sglib.core.data.Numeric;
	import sglib.core.infs.load.ILoader;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface IVisualEx extends IVisualObject
	{
		function get url(): String;
		function set url(purl: String): void;
		function get loadProgress(): Numeric;
	}
	
}