﻿package loader
{
	import flash.display.MovieClip;
	import flash.system.LoaderContext;
	import sglib.core.constant.LoadStatus;
	import sglib.core.gen.newLoaderGraphic;
	import sglib.core.infs.load.ILoaderGraphic;
	import sglib.service.load.LoaderGraphic;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class LoaderGraphicTest extends MovieClip
	{
		private var ld : ILoaderGraphic;
		
		public function LoaderGraphicTest() 
		{
			//import
			var a : LoaderGraphic;
			
			ld = newLoaderGraphic();
			ld	.context(true)
				.onLoadProgress(onProgress)
				.onLoadStatus(onStatus)
				.startLoad('1.jpg');
		}
		
		private function onProgress():void
		{
			trace(ld.loadProgress.value);
		}
		
		private function onStatus():void
		{
			if (ld.loadStatus.value == LoadStatus.COMPLETED ) addChild(ld.loadContent);
			trace(ld.loadStatus.value);
		}
		
	}

}