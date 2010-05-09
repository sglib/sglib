package sglib.display.base 
{
	import flash.display.DisplayObject;
	import sglib.core.data.Group;
	import sglib.core.data.Numeric;
	import sglib.core.infs.visual.IVisualBuffer;
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
			
			if (_position) _onChangedPosition();
		}
		
		public function set position(pvalue:Numeric):void
		{
			_position = pvalue;
			_position.addLsn(_onChangedPosition);
		}
		
		private function _onChangedPosition():void
		{
			var pos : int = getPosition(getPct());
			
			if (Math.abs(getPct() * _total-_last)>= _nBuff) {
				//TODO : Optimize moving/update only items that changes
				var itm		: DisplayObject;
				
				for (var i: int = 0; i < _l; i++) {
					itm = _items[i];
					view.addChild(itm);
					_modifier(itm, pos - _h + i);
				}
				
				_last = pos;
			}
		}
		
		private function getPct():Number
		{
			return ((_total - _nView) * _position.value + (_nView >> 1)) / _total;
			//return _position.value;
		}
		
		public function get pos(): Number {
			var p : Number = getPct() * _total;
			p -= (_nView >> 1);
			return Math.max(0, Math.min(p, _total - _nView));
		}
		
		/* return the correct center position with awareness of minimum / maximum possible values */
		private function getPosition(pvalue: Number): int {
			if (pvalue < 0) pvalue = 0;
			var pos : int = (pvalue >= 1) ? _total - 1 : int(pvalue * _total);
			return (_total > _l) ? (pos > _total - _h) ? _total - _h : (pos < _h) ? _h: pos : _h;
		}
		
	}

}