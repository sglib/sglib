package sglib.display.base 
{
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import sglib.core.constant.LoadStatus;
	import sglib.core.constant.VisualStatus;
	import sglib.core.data.Numeric;
	import sglib.core.gen.newLoaderGraphic;
	import sglib.core.infs.load.ILoader;
	import sglib.core.infs.load.ILoaderGraphic;
	import sglib.core.infs.play.IPlayerGraphic;
	import sglib.core.infs.visual.IVisualGraphic;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class VisualGraphic extends VisualObject implements IVisualGraphic
	{
		protected var _loader : ILoaderGraphic;		
		protected var _content : DisplayObject;
		
		public function VisualGraphic(ploader : ILoaderGraphic = null) 
		{
			_loader = ploader ? ploader : newLoaderGraphic();
			//_loader.reuseLoader = false; /* so we can access _loaderInfo later */
			_loader.onLoadStatus(_onLoadStatus);
		}
		
		protected function _updateContent(): void {
			_content = _loader.loadContent;
			_view.addChild(_content);
			_width = _content.loaderInfo.width;
			_height = _content.loaderInfo.height;
			_regAlign(_content);
		}
		
		override protected function _updateReg():void 
		{
			_regAlign(_content);
		}
		
		private function _onLoadStatus():void
		{
			switch (_loader.loadStatus.value) {
				case LoadStatus.COMPLETED	: 
					_updateContent();
					_status.value = VisualStatus.READY;
					break; /*  */
				case LoadStatus.ERROR		: 
					_status.value = VisualStatus.ERROR;
					break; /* show error ? */
				case LoadStatus.LOADING		: 
					if (_content && _content.parent == _view) _view.removeChild(_content);
					_status.value = VisualStatus.DISABLED;
					break; /* show loading ? */
			}
		}
		
		public function get loadProgress():Numeric { return _loader.loadProgress; }
		
		public function get asLoader():ILoaderGraphic {	return _loader }
		
		public function get asPlayer():IPlayerGraphic {	return _loader.player }
		
		public function get url():String { return _loader.url }
		
		public function set url(purl:String):void { _loader.startLoad(purl) }
		
	}

}