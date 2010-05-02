package sglib.core.utils
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public function shuffleArray(src: Array): Array 
	{
		var l		: int = src.length;
		var newArr	: Array = src.concat();
		
		for (var i: int = 0; i < l; i++) {
			var pos : int = int(Math.random() * 1000) % l;
			var itm : Object = newArr.splice(pos, 1)[0];
			newArr.push(itm);
		}
		return newArr;
	}
}