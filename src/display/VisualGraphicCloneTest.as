package display 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import sglib.core.gen.newVisualGraphic;
	import sglib.core.infs.visual.IVisualGraphic;
	import sglib.core.utils.display.clone;
	import sglib.display.base.VisualGraphic;
	import sglib.service.load.LoaderGraphic;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class VisualGraphicCloneTest extends Sprite
	{
		protected var vg : IVisualGraphic;
		
		public function VisualGraphicCloneTest() 
		{
			//import ::
			var a: LoaderGraphic;
			var b: VisualGraphic;
			
			vg = newVisualGraphic();
			vg.asLoader.context(true).startLoad('1.jpg');
			addChild(vg.view);
			vg.view.x = 200;
			
			vg.asLoader.onLoadStatus(onLoaderStatus, null, true);
		}
		
		private function onLoaderStatus():void
		{
			addChild(clone(vg.view.getChildAt(0)));
			var bmd : BitmapData = (vg.view.getChildAt(0) as Bitmap).bitmapData;
			
			bmd.fillRect(new Rectangle(0, 0, 20, 30), 0xff0000);
		}
		
	}

}