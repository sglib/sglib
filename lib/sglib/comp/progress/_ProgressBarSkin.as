package sglib.comp.progress 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import sglib.core.infs.comp.IProgressSkin;
	import sglib.core.utils.pct2Val;
	
	/**
	 * ...
	 * @author Khac-Thanh
 	 * khacthanh.1985@gmail.com
	 */
	public class ProgressBarSkindsfasdf implements IProgressSkin
	{
		protected var _view		: Sprite;
		protected var _track	: DisplayObject;
		protected var _level	: DisplayObject;
		protected var _width	: int;
		protected var _height	: int;
		protected var _isHorz	: Boolean;
		protected var _percent	: Number;
		
		public function ProgressBarSkin() 
		{
			_percent = 0;
		}
		
		public function onProgress(pct:Number):void
		{
			trace('set percent :: ', pct);
			_percent = pct;
			_isHorz ? _level.width = pct2Val(0, _width, pct, true) : _level.height = pct2Val(0, _height, pct, true);
		}
		
		public function set view(pview:DisplayObject):void
		{
			_view = pview as Sprite;
			_track = _view.getChildByName('skTrack');
			_level = _view.getChildByName('skLevel');
			setSize(pview.width, pview.height);
		}
		
		public function get view():DisplayObject { return _view; }
		
		public function setSize(pw:int, ph:int):void
		{
			_width = pw;
			_height = ph;
			_track.width = pw;
			_track.height = ph;
			_isHorz = _width > _height;
			_isHorz ? _level.height = _height : _level.width = _width;
			
			onProgress(_percent);
		}
		
		/* INTERFACE sglib.core.infs.comp.IProgressSkin */
		
		public function get width():int
		{
			return _width;
		}
		
		public function get height():int
		{
			return _height;
		}
		
	}
	
}