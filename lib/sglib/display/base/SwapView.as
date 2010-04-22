package sglib.display.base 
{
	import sglib.core.data.Numeric;
	import sglib.core.infs.load.ILoader;
	import sglib.core.infs.visual.ISwapView;
	import sglib.core.infs.visual.IVisualEx;
	import sglib.display.VisualEx;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class SwapView extends VisualObject implements ISwapView
	{
		protected var view1			: IVisualEx;
		protected var view2			: IVisualEx;
		
		protected var _url			: String;
		protected var _is1			: Boolean;
		protected var _progress		: Numeric; /* unified by view1's progress && view2's progress */
		
		public function SwapView() 
		{
			_progress = new Numeric();
		}
		
		public function setViewElements(pview1:IVisualEx, pview2:IVisualEx):IVisualEx
		{
			//TODO : Remove old view1, view2
			
			view1 = pview1;
			view2 = pview2;
			_view.addChild(view1);
			_is1 = true;
			
			view1.loadProgress.addLsn(_onProgress, [view1.loadProgress]);
			view2.loadProgress.addLsn(_onProgress, [view2.loadProgress]);
		}
		
		protected function _onProgress(pprogress: Numeric):void
		{
			_progress.value = pprogress.value;
		}
		
		public function get loadProgress():Numeric { return _progress; };
		
		public function get url():String { return _url; }
		
		public function set url(purl:String):void {
			_url = purl;
			//do load or change url if it's loading
		}
		
		
	}

}