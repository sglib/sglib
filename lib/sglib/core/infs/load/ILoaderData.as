package sglib.core.infs.load 
{
	import flash.text.StyleSheet;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 09 May 2010 (0.1.0)
	 */
	public interface ILoaderData extends ILoader
	{
		function setVariables(pvariables: Object):ILoaderData;
		function get data():*;
		function get dataAsXML():XML;
		function get dataAsCSS(): StyleSheet;
	}
	
}