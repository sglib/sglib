package sglib.core.infs.visual 
{
	import flash.display.Bitmap;
	import sglib.core.data.Numeric;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public interface IVisualWebcam extends IVisualObject
	{
		function setConfig(pw:int, ph:int, pfps:Number = 15):IVisualWebcam;
		
		function shot():Bitmap;
		
		function startRecord(pserver: String, pname:String):IVisualWebcam;
		function stopRecord():IVisualWebcam;
		//function get volume(): Numeric;
	}
	
}