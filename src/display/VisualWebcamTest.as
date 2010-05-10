package display 
{
	import sglib.core.gen.newVisualWebcam;
	import sglib.core.infs.visual.IVisualWebcam;
	import sglib.display.base.VisualWebcam;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public class VisualWebcamTest extends Test
	{
		protected var wc : IVisualWebcam;
		
		public function VisualWebcamTest() 
		{
			//import 
			var a : VisualWebcam;
			
			wc = newVisualWebcam();
			addChild(wc.view);
			wc.setConfig(320, 240, 24);
		}
		
	}

}