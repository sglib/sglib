package display 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import sglib.controller.play.PlayerVideo;
	import sglib.core.constant.Classes;
	import sglib.core.data.State;
	import sglib.core.infs.visual.IVisualVideo;
	import sglib.core.utils.Frame;
	import sglib.core.utils.Instantiate;
	import sglib.display.base.VisualVideo;
	import sglib.service.load.LoaderVideo;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class VisualVideoTest extends MovieClip
	{
		protected var vd : IVisualVideo;
		
		public function VisualVideoTest() 
		{
			
			//import 
			var a : PlayerVideo;
			var b : LoaderVideo;
			var c : VisualVideo;
			
			//vd = instantiate('sglib.display.base.VisualVideo') as IVisualVideo;
			vd = Instantiate.Visual.video;
			vd.asPlayer.playStatus.addLsn(onChangeStatus, [vd.asPlayer.playStatus]);
			addChild(vd.view);
			vd.url = '1.flv';
			
			vd.view.x = stage.stageWidth/2;
			vd.view.y = stage.stageHeight/2;
			
			vd.view.addEventListener(MouseEvent.CLICK, onClickVideo);
			
			Frame.onEnter(update, null, false);
		}
		
		private function onChangeStatus(st: State):void
		{
			trace(st.value);
		}
		
		private function update():void
		{
			var pctX : Number = stage.mouseX / stage.stageWidth;
			var pctY : Number = stage.mouseY / stage.stageHeight;
			
			vd.setReg(pctX, pctY);
			vd.view.rotation++;
		}
		
		private function onClickVideo(e:MouseEvent):void 
		{
			vd.asPlayer.toggle();
			//trace(vd.asPlayer.playStatus.value)
		}
		
	}

}