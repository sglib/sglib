package loader
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.system.LoaderContext;
	import sglib.core.constant.LoadStatus;
	import sglib.core.debug.doGC;
	import sglib.core.gen.newGraphicCacher;
	import sglib.core.gen.newLoaderGraphic;
	import sglib.core.infs.load.IGraphicCacher;
	import sglib.core.infs.load.ILoaderGraphic;
	import sglib.core.utils.Frame;
	import sglib.service.load.GraphicCacher;
	import sglib.service.load.LoaderGraphic;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class LoaderGraphicCacherTest extends MovieClip
	{
		private var cc		: IGraphicCacher;
		private var id		: int;
		protected var arr	: Array;
		
		//configuration
		protected var useCacher : Boolean = true;
		
		public function LoaderGraphicCacherTest() 
		{
			//import
			var a : LoaderGraphic;
			var b : GraphicCacher;
			
			cc	= newGraphicCacher();
			arr = [];
			
			//make a sequence loading
			var ld	: ILoaderGraphic;
			for (var i: int = 0; i < 96; i++) {
				ld = newLoaderGraphic();
				if (useCacher) ld.cacher = cc;
				ld.url = '1.jpg';
				ld.onLoadStatus(onStatus, [ld]);
				arr.push(ld);
			}
			
			(arr[0] as ILoaderGraphic).startLoad();
		}
		
		private function onStatus(ld: ILoaderGraphic = null):void
		{
			if (ld.loadContent) {
				addChild(ld.loadContent);
				ld.loadContent.x = (id % 16) * 50;
				ld.loadContent.y = int(id / 16) * 100;
				id++;
				if (id < arr.length) (arr[id] as ILoaderGraphic).startLoad();
			}
		}
		
	}

}