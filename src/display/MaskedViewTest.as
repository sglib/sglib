package display 
{
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import sglib.core.constant.LoadStatus;
	import sglib.core.infs.play.IPlayerGraphic;
	import sglib.core.infs.visual.IMaskedView;
	import sglib.core.infs.visual.IVisualGraphic;
	import sglib.core.utils.Instantiate;
	import sglib.core.utils.val2Pct;
	import sglib.display.base.MaskedView;
	import sglib.display.base.VisualGraphic;
	import sglib.service.load.LoaderGraphic;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class MaskedViewTest extends Test
	{
		protected var _mv : IMaskedView;
		protected var _gp : IVisualGraphic;
		
		public function MaskedViewTest() 
		{
			//import
			var a : MaskedView;
			var b : VisualGraphic;
			var c : LoaderGraphic;
			var d : IPlayerGraphic;
			
			_mv = Instantiate.Visual.maskedView;
			_gp = Instantiate.Visual.graphic;
			_mv.setVisualContent(_gp);
			_gp.url = 'big.png';
			_gp.url = '2.jpg';
			
			_mv.setSize(stage.stageWidth, stage.stageHeight);
			addChild(_mv.view);
		}
		
		override protected function _onStageResize(e:Event):void 
		{
			_mv.setSize(stage.stageWidth, stage.stageHeight);
		}
		
		override protected function _onEnterFrame(e:Event):void 
		{
			_mv.hzPosition.value += (val2Pct(20, stage.stageWidth-20, stage.mouseX, true)-_mv.hzPosition.value)/2;
			_mv.vtPosition.value += (val2Pct(20, stage.stageHeight-20, stage.mouseY, true) - _mv.vtPosition.value)/2;
		}
	}

}