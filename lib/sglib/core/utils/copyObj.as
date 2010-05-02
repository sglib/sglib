package sglib.core.utils
{
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
		
	/**
	 * copy specified (or all) properties from one object to another.
	 * @param	ptarget the object to be changed
	 * @param	psource the object to be read from
	 * @param	pprops the properties you'd like to copy ('' or null for all props)
	 */
	public function copyObj(ptarget: Object, psource: Object = null, pprops: String = null): Object
	{
		if (!psource) return ptarget;
		
		if (pprops=='' || pprops == null){
			for (var s: String in psource) 
			{
				if (s != '') ptarget[s] = psource[s];
			}
		} else {
			var props : Array = pprops.split('|');
			var cprop : String;
			var l : int = props.length;
			
			for (var j: int = 0; j < l; j++ )
			{
				cprop = pprops[j];
				if (cprop != '') ptarget[cprop] = psource[cprop];
			}	
		}
		
		return ptarget;
	}
	
}