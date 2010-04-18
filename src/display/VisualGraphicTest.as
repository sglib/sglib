package display 
{
	import flash.display.Sprite;
	import sglib.core.constant.Classes;
	import sglib.core.infs.visual.IVisualGraphic;
	import sglib.core.utils.Instantiate;
	import sglib.display.base.VisualGraphic;
	import sglib.service.load.LoaderGraphic;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class VisualGraphicTest extends Sprite
	{
		protected var vg : IVisualGraphic;
		
		public function VisualGraphicTest() 
		{
			//import ::
			var a: LoaderGraphic;
			var b: VisualGraphic;
			
			vg = Instantiate.Visual.graphic;
			vg.url = 'logo.png';
			vg.asLoader.context(true).startLoad('logo.png');
			addChild(vg.view);
		
		}
		
	}

}