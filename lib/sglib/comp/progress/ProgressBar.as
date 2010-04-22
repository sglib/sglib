package sglib.comp.progress 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
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
			
		}
		
		override protected function _onProgress():void 
		{
			
		}
		
	}

}