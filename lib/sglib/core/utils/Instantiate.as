package sglib.core.utils 
{
	import flash.utils.getDefinitionByName;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * generate class instances from the full class name (package.ClassName)
	 * @param	pname the name of the class to be instantiated
	 * @return
	 */
	public function instantiate(pname: String) : Object
	{
		var cls : Class = getDefinitionByName(pname) as Class;
		if (cls) return new cls();
		return null;
	}
	
}