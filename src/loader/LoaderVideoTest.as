package loader 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.media.Video;
	import sglib.core.infs.load.ILoaderVideo;
	import sglib.service.load.LoaderVideo;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note 
	 *  	
	 * @update 14 April 2010 (0.1.0)
	 *
	 */
	public class LoaderVideoTest extends MovieClip
	{
		protected var ld		: ILoaderVideo;
		protected var video		: Video;
		
		public function LoaderVideoTest() 
		{
			ld = new LoaderVideo();
			ld	.onLoadProgress(_onProgress)
				.onLoadStatus(_onStatus)
				.startLoad('http://www.albumcuatui.net/thienhaflash/ActionScript 3 Log.flv?' + Math.random());
				//.startLoad('1.flv');
				
			video = new Video();
			video.attachNetStream(ld.stream);
			addChild(video);
			//ld.client.onMetaData = function (info: Object):void {
				//video.width = info.width;
				//video.height = info.height;
				//addChild(video);
			//}
			
			ld.stream.resume();			
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			(ld.loadStatus.value == 'LOADING') ? ld.stopLoad() : ld.startLoad();
		}
		
		private function _onStatus():void
		{
			trace('status: ', ld.loadStatus.value);
		}
		
		private function _onProgress():void
		{
			trace('progress :: ', ld.loadProgress.value);
		}
		
	}

}