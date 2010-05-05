package sglib.service.load
{
	import flash.display.DisplayObject;
	import flash.utils.Dictionary;
	import sglib.core.infs.load.IGraphicCacher;
	import sglib.core.utils.display.clone;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public class GraphicCacher implements IGraphicCacher
	{
		protected var _dict 		: Dictionary;
		protected var _cloneBitmap	: Boolean;
		protected var _cloneObject	: Boolean;
		
		public function GraphicCacher(pcloneObject: Boolean = true, pcloneBitmap: Boolean = false) 
		{
			_dict = new Dictionary(true);/* using weak reference */
			_cloneObject = pcloneObject;
			_cloneBitmap = pcloneBitmap;
		}
		
		/**
		 * @inheritDoc
		 */
		public function fromURL(purl: String): DisplayObject {
			var pdo : DisplayObject = _dict[purl];
			return (_cloneObject && pdo) ? clone(pdo, _cloneBitmap) : pdo;
		}
		
		/**
		 * @inheritDoc
		 */
		public function setURL(purl: String, pdo : DisplayObject): DisplayObject {
			return _dict[purl] = pdo;
		}
		
		/**
		 * @inheritDoc
		 */
		public function set cloneBitmap(pvalue:Boolean):void 
		{
			_cloneBitmap = pvalue;
		}
		
		/**
		 * @inheritDoc
		 */
		public function set cloneObject(pvalue:Boolean):void 
		{
			_cloneObject = pvalue;
		}
	}

}