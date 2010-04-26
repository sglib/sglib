package sglib.core.data 
{
	import sglib.core.Callback;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class Data extends Callback
	{
		protected var _validator	: Function;
		
		public function Data(pvalidator : Function = null) 
		{
			_validator = pvalidator;
		}
		
		
	}

}