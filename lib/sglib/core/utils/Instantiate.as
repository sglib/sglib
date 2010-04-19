package sglib.core.utils 
{
	import flash.utils.getDefinitionByName;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public function instantiate(pname: String) : Object
	{
		var cls : Class = getDefinitionByName(pname) as Class;
		if (cls) return new cls();
		return null;
	}
	
}