package player 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import sglib.controller.play.PlayerAudio;
	import sglib.core.infs.play.IPlayerAudio;
	import sglib.service.load.LoaderAudio;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class PlayerAudioTest extends MovieClip
	{
		protected var pl : IPlayerAudio;
		
		public function PlayerAudioTest() 
		{
			//import :: 
			var a : LoaderAudio;
			
			pl = new PlayerAudio();
			pl.play('1.mp3');
			pl.playProgress.addLsn(onPlayProgress);
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onPlayProgress():void
		{
			trace(pl.playProgress.value);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			var pos : int = (stage.mouseX / 100) % 5;
			trace(pos);
			switch (pos) {
				case 0 : pl.play(); break;
				case 1 : pl.pause(); break;
				case 2 : pl.seek(30); break;
				case 3 : pl.stop(); break;
				case 4 : pl.toggle(); break;
			}
		}
		
	}

}