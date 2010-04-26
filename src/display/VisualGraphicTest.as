package display 
{
	import flash.display.Sprite;
	import sglib.core.gen.newVisualGraphic;
	import sglib.core.infs.visual.IVisualGraphic;
	import sglib.display.base.VisualGraphic;
	import sglib.service.load.LoaderGraphic;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class VisualGraphicTest extends Sprite
	{
		protected var vg : IVisualGraphic;
		
		public function VisualGraphicTest() 
		{
			//import ::
			var a: LoaderGraphic;
			var b: VisualGraphic;
			
			vg = newVisualGraphic();
			vg.url = 'logo.png';
			vg.asLoader.context(true).startLoad('logo.png');
			addChild(vg.view);
		
		}
		
	}

}