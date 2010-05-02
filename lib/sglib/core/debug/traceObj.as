package sglib.core.debug
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * trace all dynamic/public properties of an object
	 * @param	pobj the object to be traced properites
	 * @param	pmessage the message to show
	 */
	public function traceObj(pobj: Object, pmessage: String = 'traceObj'): void {
		trace('>>>>>>', pmessage);
		for (var i: String in pobj) {
			trace(i,' :: ', pobj[i]);
		}
	}

}