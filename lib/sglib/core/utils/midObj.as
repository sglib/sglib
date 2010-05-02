package sglib.core.utils
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * linear interpolate property values from two objects and apply to a target
	 * @param	pstart the start object (percent = 0)
	 * @param	pend the end object (percent = 1)
	 * @param	ppercent the interpolation percentage
	 * @param	ptarget the object to be applied 
	 * @return
	 */
	public function midObj(pstart: Object, pend:Object, ppercent: Number, ptarget : Object = null) : Object
	{
		if (!ptarget) ptarget = { };
		for (var s: String in pstart) {
			ptarget[s] = pstart[s] + (pend[s] - pstart[s]) * ppercent;
		}
		return ptarget;
	}
}