package loader 
{
	import sglib.core.constant.LoadStatus;
	import sglib.core.gen.newLoaderData;
	import sglib.core.infs.load.ILoaderData;
	import sglib.service.load.LoaderData;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 09 May 2010 (0.1.0)
	 */
	public class LoaderDataTest extends Test
	{
		protected var _loader : ILoaderData;
		
		public function LoaderDataTest() 
		{
			//import 
			var a : LoaderData;
			
			_loader = newLoaderData();
			_loader.onLoadStatus(onLoadStatus);
			_loader.startLoad('1.xml');
		}
		
		private function onLoadStatus():void
		{
			if (_loader.loadStatus.value == LoadStatus.COMPLETED) {
				trace(_loader.dataAsXML);
			}
		}
		
		
		
	}

}