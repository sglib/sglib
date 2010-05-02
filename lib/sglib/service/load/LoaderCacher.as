package sglib.service.load 
{
	import flash.display.DisplayObject;
	import flash.utils.Dictionary;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class LoaderCacher
	{
		protected var _dict : Dictionary;
		
		public function LoaderCacher() 
		{
			_dict = new Dictionary(true);
		}
		
		public function fromURL(purl: String, pclone: Boolean = true): DisplayObject {
			var pdo : DisplayObject = _dict[purl];
			
			if (pclone && pdo) {
				
			}
			
			return pdo;
		}
		
		public function setURL(purl: String, pdo : DisplayObject): DisplayObject {
			_dict[purl] = pdo;
		}
	}

}