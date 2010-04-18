package player 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.media.Video;
	import sglib.controller.play.PlayerVideo;
	import sglib.service.load.LoaderVideo;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note 
	 *  	
	 * @update 14 April 2010 (0.1.0)
	 *
	 */
	public class PlayerVideoTest extends MovieClip
	{
		protected var pv : PlayerVideo;
		
		public function PlayerVideoTest() 
		{	
			//import
			var a : LoaderVideo;
			
			pv = new PlayerVideo();
			pv.onPlayStatus(onStatus);
			pv.play('1.flv');
			
			var vid : Video = new Video();
			vid.attachNetStream(pv.loader.stream);
			addChild(vid);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
		}
		
		private function onStatus():void
		{
			trace('onStatus :: ', pv.playStatus.value);
		}
		
		private function onDown(e:MouseEvent):void 
		{
			var pos : int = (stage.mouseX / 100) % 5;
			
			switch (pos) {
				case 0 : pv.play(); break;
				case 1 : pv.pause(); break;
				case 2 : pv.seek(30); break;
				case 3 : pv.stop(); break;
				case 4 : pv.toggle(); break;
			}
		}
		
	}

}