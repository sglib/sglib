package  
{
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	/**
	 * ...
	 * @author thienhaflash (thienhaflash@gmail.com)
	 */
	public class Test extends MovieClip
	{
		
		public function Test() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			stage.addEventListener(Event.ENTER_FRAME, _onEnterFrame);
			stage.addEventListener(Event.RESIZE, _onStageResize);
		}
		
		protected function _onStageResize(e:Event):void 
		{
			
		}
		
		protected function _onEnterFrame(e:Event):void 
		{
			
		}
		
	}

}