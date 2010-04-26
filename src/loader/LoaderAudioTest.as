package loader
{
	import flash.display.MovieClip;
	import sglib.core.gen.newLoaderAudio;
	import sglib.core.infs.load.ILoaderAudio;
	import sglib.service.load.LoaderAudio;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class LoaderAudioTest extends MovieClip
	{
		protected var ld : ILoaderAudio;
		
		public function LoaderAudioTest() 
		{
			//import
			var a : LoaderAudio;
			
			ld = newLoaderAudio();
			ld.onLoadStatus(onStatus).onLoadProgress(onProgress).startLoad('1.mp3');
		}
		
		private function onStatus():void
		{
			trace(ld.loadStatus.value);
		}
		
		private function onProgress():void
		{
			trace(ld.loadProgress.value);
		}
		
	}
}