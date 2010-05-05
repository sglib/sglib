package sglib.core.infs.load 
{
	import flash.display.DisplayObject;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public interface IGraphicCacher 
	{
		/**
		 * get the cached content from the base URL
		 * @param	purl the base url that used to load the DisplayObject
		 * @return null if the Content was removed from memory by the GC
		 */
		function fromURL(purl: String): DisplayObject;
		
		/**
		 * register the DisplayObject with its base URL
		 * @param	purl the base URL
		 * @param	pdo the DisplayObject
		 * @return
		 */
		function setURL(purl: String, pdo : DisplayObject): DisplayObject;
		
		/**
		 * clone the bitmap data or not
		 */
		function set cloneBitmap(pvalue:Boolean):void;
		
		/**
		 * clone the display object or not
		 */
		function set cloneObject(pvalue:Boolean):void;
	}
	
}