package service 
{
	import flash.events.MouseEvent;
	import sglib.core.constant.UploaderInfo;
	import sglib.core.gen.newUploader;
	import sglib.core.infs.IUploader;
	import sglib.service.Uploader;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public class UploaderTest extends Test
	{
		protected var ud : IUploader;
		
		public function UploaderTest() 
		{
			//import 
			var a : Uploader;
			
			ud = newUploader();
			
			ud.setServer('http://www.google.com/abc/')
				.setSizeLimit(1024, 1024 * 1024 * 10)
				.autoRemove(true, true)
				.info.addLsn(onInfo);
				
			ud.fileProgress.addLsn(onFileProgress)
				
			
			stage.addEventListener(MouseEvent.CLICK, onClickStage);
		}
		
		private function onFileProgress():void
		{
			trace(ud.fileProgress.value, ' - ', ud.totalProgress.value);
		}
		
		private function onClickStage(e:MouseEvent):void 
		{
			ud.browse(Math.random()<0.5);
		}
		
		private function onInfo():void
		{
			if (ud.info.value == UploaderInfo.LIST_CHANGED) ud.start();
			trace(ud.info.value, ud.list.length, '::', ud.list);
		}
		
	}

}