packagesglib.core.utils
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	public function func(f: Function, p: Array = null ): Function {
		
		var af : Function = function (...rest): void {
			f.apply(null, p);
		};
		return af;
	}

}