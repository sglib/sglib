package sglib.core.utils.math 
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 02 May 2010 (0.1.0)
	 */
	
	/**
	 * 
	 * @param	pvalue the value need to get modulo offset
	 * @param	pmax maximum acceptable value
	 * @param	pmin minimum acceptable value
	 * @return
	 */
	public function offset(pvalue: int, pmax: int, pmin: int = 0) : int
	{
		var l : int = pmax - pmin + 1;
		while (pvalue < pmin) pvalue += l;
		return (pvalue-pmin) % l + pmin;
	}
	
}