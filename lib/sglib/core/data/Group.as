package sglib.core.data 
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class Group extends Data
	{
		protected var _last		: int;
		protected var _active	: int;
		protected var _total	: int;
		
		public function Group(ptotal: int = 1, pactive: int = -1, pvalidator : Function = null) 
		{
			super(pvalidator);
			_last = -1;
			_active = pactive;
			_total = ptotal;
		}
		
		public function get lastActive(): int {	return _last; }
		
		public function get active():int { return _active; }
		
		public function set active(pvalue:int):void 
		{
			if ((pvalue != _active) && ((_validator==null) || _validator(pvalue))) {
				_last = _active;
				_active = pvalue;
				dispatch();
			}
		}
		
		public function get total():int { return _total; }
		
		public function set total(value:int):void 
		{
			_total = value;
			_last = -1;
			active = 0;
		}
		
	}

}