package sglib.comp.progress 
{
	import sglib.core.data.Numeric;
	import sglib.core.infs.comp.IProgress;
	import sglib.core.infs.comp.IProgressSkin;
	import sglib.core.infs.comp.ISkin;
	import sglib.display.base.VisualObject;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note 
	 * 
	 * @update 23 April 2010 (0.1.0)
	 */
	public class Progress extends VisualObject implements IProgress
	{
		protected var _progress : Numeric;
		
		public function setProgress(pvalue:Numeric):IProgress
		{
			if (_progress) _progress.remLsn(_onProgress);
			_progress = pvalue;
			_progress.addLsn(_onProgress);
		}
		
		protected function _onProgress(): void {
			//update skin
		}
	}
	
}