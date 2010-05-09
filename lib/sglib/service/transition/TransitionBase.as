package sglib.service.transition 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import sglib.core.data.Numeric;
	import sglib.core.infs.transition.ITransition;
	import sglib.core.utils.Frame;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public class TransitionBase implements ITransition
	{
		protected var _bound	: Object;
		protected var _parent	: DisplayObjectContainer;
		protected var _progress : Numeric;
		
		public function TransitionBase() 
		{
			_progress = new Numeric();
			_progress.addLsn(onSetProgress);
		}
		
		private function onSetProgress():void
		{
			//update targets
		}
		
		public function get view():DisplayObject { return null }
		
		public function setBound(pbound:Object):ITransition { _bound = pbound; }
		
		public function setParent(pparent:DisplayObject):void { _parent = pparent }
	}

}