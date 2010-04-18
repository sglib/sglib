package sglib.comp.progress 
{
	import sglib.core.data.Numeric;
	import sglib.core.infs.comp.IProgress;
	import sglib.core.infs.comp.IProgressSkin;
	import sglib.core.infs.comp.ISkin;
	
	/**
	 * ...
	 * @author Khac-Thanh
 	 * khacthanh.1985@gmail.com
	 */
	public class Progress implements IProgress
	{
		protected var _progress : Numeric;
		protected var _skin		: IProgressSkin;
		
		public function Progress() 
		{
			
		}
		
		public function setProgress(pvalue:Numeric):IProgress
		{
			if (_progress) _progress.remLsn(_onProgress);
			_progress = pvalue;
			_progress.addLsn(_onProgress);
			_onProgress();//update view
			return this;
		}
		
		private function _onProgress():void
		{
			trace('on Progress ');
			if (_skin) _skin.onProgress(_progress.value);
		}
		
		public function setSkin(pskin:IProgressSkin):IProgress
		{
			_skin = pskin;
			if (_progress) {
				_skin.onProgress(_progress.value);
				trace('addListeners');
			}
			return this;
		}
		
		public function seek(pvalue:Number):IProgress
		{
			//do seek
			return this;
		}
		
		/* INTERFACE sglib.core.infs.comp.IProgress */
		
		public function get skin():IProgressSkin
		{
			return _skin;
		}
		
	}
	
}