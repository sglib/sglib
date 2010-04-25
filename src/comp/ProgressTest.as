package comp 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import sglib.comp.Progress;
	
	import sglib.comp.progress.ProgressBar;	
	import sglib.controller.play.PlayerAudio;
	import sglib.controller.play.PlayerVideo;
	import sglib.core.data.Numeric;
	import sglib.core.data.State;
	import sglib.core.infs.comp.IProgress;
	import sglib.core.infs.load.ILoaderAudio;
	import sglib.core.infs.play.IPlayerAudio;
	import sglib.core.infs.play.IPlayerVideo;
	import sglib.core.infs.visual.IVisualVideo;
	import sglib.core.utils.drwRect;
	import sglib.core.utils.Frame;
	import sglib.display.base.VisualVideo;
	import sglib.service.load.LoaderAudio;
	import sglib.service.load.LoaderVideo;
	
	/**
	 * ...
	 * @author Khac-Thanh
 	 * khacthanh.1985@gmail.com
	 */
	public class ProgressTest extends Test
	{
		protected var pl : IPlayerAudio;
		protected var p  : Progress;
		
		protected var vl:IVisualVideo;
		
		public function ProgressTest() 
		{
			var a : LoaderAudio;
			var v: PlayerVideo;
			var l:LoaderVideo;
			
			
			
			vl = new VisualVideo();
			vl.asPlayer.play("1.flv");
			vl.asPlayer.onPlayProgress(onPlaying);
			addChild(vl.view);
			
			/*pl = new PlayerAudio();
			pl.play('1.mp3');
			pl.onPlayProgress(onPlaying);*/
		
			var sk:IProgress = new ProgressBar();
			sk.seekable = true;
			sk.view = newSkin();		
			addChild(sk.view);
			
			
			sk.setProgress(vl.asPlayer.playProgress);
			
		}
		private function onPlaying():void {
			//trace(this, pl.playProgress.value);
		}
		
		
		public function newSkin(): Sprite {
			var sprt : Sprite = new Sprite();
			var child : Sprite = new Sprite();
			child.name = 'skTrack';
			sprt.addChild(drwRect(child, 0x00ff00, 200, 20));
			child = new Sprite();
			child.name = 'skLevel';
			sprt.addChild(drwRect(child, 0xff0000, 200, 20));
			return sprt;
		}
	}
	
}