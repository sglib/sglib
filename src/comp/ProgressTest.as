package comp 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import sglib.comp.progress.Progress;
	import sglib.comp.progress.ProgressBarSkin;
	import sglib.controller.play.PlayerAudio;
	import sglib.controller.play.PlayerVideo;
	import sglib.core.data.State;
	import sglib.core.infs.comp.IProgressSkin;
	import sglib.core.infs.load.ILoaderAudio;
	import sglib.core.infs.play.IPlayerAudio;
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
		
		public function ProgressTest() 
		{
			var a : LoaderAudio;
			
			pl = new PlayerAudio();
			pl.play('1.mp3');
			//pl.playProgress.addLsn(onPlayProgress);
			//stage.addEventListener(MouseEvent.CLICK, onClick);
			
			p = new Progress();
			p.setProgress(pl.playProgress);
			
			var sk : IProgressSkin = new ProgressBarSkin();
			sk.view = newSkin();
			p.setSkin(sk);
			addChild(p.skin.view);			
		}
		
		//private function onChangeStatus(st: State):void
		//{
			//trace(st.value);
		//}
		//
		//private function update():void
		//{
			//var pctX : Number = stage.mouseX / stage.stageWidth;
			//var pctY : Number = stage.mouseY / stage.stageHeight;
			//
			//vd.setReg(pctX, pctY);
			//vd.view.rotation++;
		//}
		//
		//private function onClickVideo(e:MouseEvent):void 
		//{
			//vd.asPlayer.toggle();
			//trace(vd.asPlayer.playStatus.value)
		//}
		
		
		
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