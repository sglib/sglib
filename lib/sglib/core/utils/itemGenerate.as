package sglib.core.utils 
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * generate nItems by calling fInit(id: int)-> Object
	 * @param	pnItems number of items to be generated
	 * @param	pfNew the function to be called, should be in the form of f(id : int): Object
	 * @return the array of items generated
	 */
	public function itemGenerate(pnItems: int, pfNew: Function): Array 
	{
		var arr : Array = [];
		for (var i: int = 0; i < pnItems; i++) {
			arr.push(pfNew(i));
		}
		return arr;
	}
	
}