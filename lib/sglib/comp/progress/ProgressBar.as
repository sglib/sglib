package sglib.comp.progress 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import sglib.comp.Progress;
	/**
	 * @version 0.1.0
	 * @author ...
	 * @note 
	 * 
	 * @update 23 April 2010 (0.1.0)
	 */
	public class ProgressBar extends Progress
	{
		//view elements
		protected var track : DisplayObject;
		protected var level	: DisplayObject;
		
		public function ProgressBar() 
		{
			
		}
		
		override public function set view(value:Sprite):void 
		{
			super.view = value;
			track = _view.getChildByName("skTrack");
			level = _view.getChildByName("skLevel");
			
			
			if(seekable)track.parent.addEventListener(MouseEvent.MOUSE_DOWN, _onSeek);
			
			_onProgress();
		}
		
		override protected function _onProgress():void 
		{
			if(_progress)level.width = _progress.value * track.width;
		}
		
		private function _onSeek(ev:MouseEvent):void {
			_progress.value  = track.mouseX / track.width;
		}
		
	}

}