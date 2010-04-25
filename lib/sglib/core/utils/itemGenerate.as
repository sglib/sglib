package sglib.core.utils 
{
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public function itemGenerate(pn: int, pfInit: Function): Array 
	{
		var arr : Array = [];
		for (var i: int = 0; i < pn; i++) {
			arr.push(pfInit(pn));
		}
		return arr;
	}
	
}