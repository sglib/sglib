package display 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import sglib.core.constant.LoadStatus;
	import sglib.core.constant.VisualStatus;
	import sglib.core.gen.newLoaderGraphic;
	import sglib.core.gen.newTextField;
	import sglib.core.gen.newVisualGraphic;
	import sglib.core.infs.load.ILoaderGraphic;
	import sglib.core.infs.visual.IVisualGraphic;
	import sglib.display.base.VisualGraphic;
	import sglib.display.base.VisualText;
	import sglib.service.load.LoaderGraphic;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 18 May 2010 (0.1.0)
	 */
	public class VisualTextTest extends Test
	{
		protected var vt 	: VisualText;
		protected var tf	: TextField;
		
		public function VisualTextTest() 
		{
			vt = new VisualText();
			addChild(vt.view);
			
			var a : LoaderGraphic;
			var ld : ILoaderGraphic = newLoaderGraphic();
			ld.onLoadStatus(onStatus, [ld]);
			ld.startLoad('staticText.swf');
		}
		
		private function onStatus(vo: LoaderGraphic):void
		{
			if (vo.loadStatus.value == LoadStatus.COMPLETED) {
				var tf : TextField = (vo.loadContent as MovieClip).getChildAt(0) as TextField;
				vt.textfield = tf;
				vt.highlight(/ \w/ig);
				vt.setSelection(0, 10);
			}
		}
		
	}

}