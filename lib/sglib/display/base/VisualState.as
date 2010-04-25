package sglib.display.base 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import sglib.core.data.State;
	import sglib.core.infs.visual.IVisualState;
	import sglib.core.utils.removeChildren;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class VisualState extends VisualObject implements IVisualState
	{
		protected var _state	: State;
		protected var _target	: Sprite;
		
		public function VisualState() 
		{
			_state = new State();
			_state.addLsn(onChangeState);
		}
		
		private function onChangeState():void
		{
			removeChildren(_view);
			_view.addChild(_target[_state.value]);
		}
		
		public function get state():State { return _state; }
		
		public function setContent(ptarget:DisplayObject):IVisualState
		{
			_target = ptarget as Sprite;
			removeChildren(_target);
			return this;
		}
		
	}

}