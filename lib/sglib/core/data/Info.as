package sglib.core.data 
{
	import flash.utils.Dictionary;
	import sglib.core.Callback;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class Info extends State
	{
		protected var _data		: Dictionary;
		
		public function Info() 
		{
			_data = new Dictionary();
		}
		
		public function setInfo(pvalue: String, pData : * = null): void {
			_value = ''; //force dispatch info
			if (pData) _data[pvalue] = pData;
			value = pvalue;
		}
		
		public function getDataOf(pvalue: String): * { return _data[pvalue]; }
		
		public function get data(): * {	return _data[_value]; }
		
	}

}