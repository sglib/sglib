package sglib.core.data
{
	import sglib.core.data.Data;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note Bindable Numbers
	 *
	 * @update 04 April 2010 (0.1.0)
	 * 		Support lastValue - helps undo an illegal set value
	 * 
	 */
	public class Numeric extends Data
	{
		protected var _lastValue	: Number;
		protected var _value 		: Number;
		
		public function Numeric(pvalue: Number = 0, pvalidator: Function = null)
		{
			super(pvalidator);
			_lastValue = 0;
			_value = pvalue;
		}
		
		public function get lastValue():Number { return _lastValue; }
		
		public function get value():Number { return _value;	}
		
		public function set value(pvalue:Number):void
		{
			if ((pvalue != _value) && ((_validator==null) || _validator(pvalue))) {
				_lastValue = _value;
				_value = pvalue;
				dispatch();
			}
		}
	}

}