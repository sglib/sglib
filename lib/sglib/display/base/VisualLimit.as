package sglib.display.base 
{
	import sglib.core.data.Group;
	import sglib.core.infs.visual.IVisualGroup;
	import sglib.core.infs.visual.IVisualLimit;
	import sglib.core.utils.copyObj;
	import sglib.core.utils.midObj;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 02 May 2010 (0.1.0)
	 */
	public class VisualLimit extends VisualObject implements IVisualLimit
	{
		protected var _items 		: Array;
		protected var _states		: Array;
		protected var _stateVal		: Number;
		
		public function VisualLimit() 
		{
			
		}
		
		public function setContent(pchildren:Array):IVisualGroup
		{
			_items = pchildren;
			_group = new Group(_items.length, -1);
			addChildren(_view, _items);
			_width = _layout.width;
			_height = _layout.height;
		}
		
		public function setStates(pStates:Array):void { _states = pStates; }
		
		public function get items():Array { return _items }
		
		public function get stateVal():Number { return _stateVal; }
		
		public function set stateVal(value:Number):void 
		{
			_stateVal = value;
			
			_stateVal = value;
				
			var base	: int = _stateVal;
			var pct		: Number = _stateVal - base;
			var h		: int = (_nStates - 1) / 2; /* one side */
			var delta	: int;
			var o		: DisplayObject;
			var invi	: Boolean;
			var adds	: Array = [];
			
			for (var i: int = 0; i < _group.nItems ; i++) {
				o = items[i];
				
				delta = i - base-1;
				invi = (delta < -h - 1) || (delta > h);
				
				if (invi) {/* =h : only show when pct == 0 */
					removeThis(o);
					copyObj(o, (delta < 0) ? _states[0]: _states[_states.length - 1]) ;
				} else {
					copyObj(o, midObj(_states[delta + h + 1], _states[delta + h + 2], 1 - pct));
					adds[ -Math.abs(i - Math.round(_stateVal)) + _states.length-1] = o; /* reserve children's depth */
				}
			}
			
			addChildren(_target, adds);
		}
	}
}