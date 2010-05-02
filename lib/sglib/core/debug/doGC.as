package sglib.core.debug
{
	import flash.net.LocalConnection;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note Original from GSkinner's GC hack - do GC - use for testing purpose only
	 * @update 26 April 2010 (0.1.0)
	 */
	
	/**
	 * do Gabage Collection - use for testing purpose only
	 */
	public function doGC() : void
	{
		try
		{
			new LocalConnection().connect("foo");
			new LocalConnection().connect("foo");
		} catch (e : Error) {}
	}
}