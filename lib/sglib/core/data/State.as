package sglib.core.data 
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class State extends Data
	{
		protected var _lastValue	: String;
		protected var _value 		: String;
		
		public function State(pstate: String = '', pvalidator: Function = null) 
		{
			super(pvalidator);
			_lastValue = '';
			_value = pstate;
		}
		
		public function get lastValue():String { return _lastValue; }
		
		public function get value():String { return _value;	}
		
		public function set value(pvalue:String):void
		{
			if ((pvalue != _value) && ((_validator==null) || _validator(pvalue))) {
				_lastValue = _value;
				_value = pvalue;
				dispatch();
			}
		}
	}

}