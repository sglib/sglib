package sglib.display.base 
{
	import flash.display.DisplayObject;
	import sglib.core.data.Group;
	import sglib.core.data.Numeric;
	import sglib.core.infs.visual.IVisualBuffer;
	import sglib.core.utils.display.removeChildren;
	import sglib.core.utils.math.val2Pct;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class VisualBuffer extends VisualObject implements IVisualBuffer
	{
		protected var _position : Numeric;
		
		protected var _total	: int;
		protected var _nView	: int;//nVisible, of couse < _l, usually = 1 || = _l-1
		protected var _nBuff	: int;
		
		protected var _last		: int;//last position
		
		protected var _h		: int;//_items.length>>1
		protected var _l		: int;//_items.length
		
		protected var _items 	: Array;
		protected var _modifier	: Function;
		
		public function VisualBuffer() 
		{
			
		}
		
		public function setConfig(pitems:Array, ptotal: int, pmodify:Function, pnView: int = -1):void
		{
			_items = pitems;
			_modifier = pmodify;
			_total = ptotal;
			
			
			_l = _items.length;
			_h = _l >> 1;
			
			_nView = (pnView == -1) ? _l - 1 : pnView;
			
			_nBuff = Math.max(0, ((_l - _nView) >> 1)-1);
			if (_position) _onChangedPosition(true);
		}
		
		public function set position(pvalue:Numeric):void
		{
			_position = pvalue;
			_position.addLsn(_onChangedPosition);
			_onChangedPosition(true);
		}
		
		private function _onChangedPosition(pforce: Boolean = false):void
		{
			var pos		: int = _position.value * (_total - _nView);
			var delta	: int = pos - _last;
			
			if (pforce || Math.abs(delta) >= _nBuff) {
				removeChildren(_view);
				//TODO : Optimize moving/update only items that changes
				
				var itm		: DisplayObject;
				var min		: int = Math.min(_l, _total);
				
				for (var i: int = 0; i < min; i++) {
					if ((pos + i >= 0) && (pos + i < _total)) {
						itm = _items[i];
						_view.addChild(itm);
						_modifier(itm, pos + i);//pos - _h + i
					}
				}
				
				_last = pos;
			}
		}
		
		public function getPos(addL: Number = 0): Number {
			var p : Number = _position.value * (_total - _nView + addL);
			return Math.max(p, 0);//Math.max(0, Math.min(p, _total - _nView));
		}
		
		public function set total(value:int):void 
		{
			_total = value;
			_position.value = 0;
			_onChangedPosition(true);
		}
	}

}