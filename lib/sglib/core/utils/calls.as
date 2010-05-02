package sglib.core.utils
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * call the function in the list sequentially
	 * @param	...rest [f, [params]], [f, [params]], ....
	 */
	public function calls(...funcList) : void
	{
		var l : int = funcList.length;
		
		for (var i: int = 0; i < l; i++) {
			if (funcList[i] is Array) {
				(funcList[i][0] as Function).apply(null, funcList[i][1]);
			} else {
				funcList[i]();
			}
		}
	}
}