package sglib.core.utils
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * set a property of objects to some value
	 * @param	ptargets the objects to be set properity
	 * @param	pprop the name of the property
	 * @param	pvalue the value of the property
	 */
	public function setValue(ptargets: Array, pprop: String, pvalue: *): void
	{
		var l: int = ptargets.length;
		for (var i: int = 0; i < l; i++) {
			ptargets[i][pprop] = pvalue;
		}
	}	
}