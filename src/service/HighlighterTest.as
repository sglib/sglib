package service 
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.geom.Matrix;
	import flash.net.URLRequest;
	import flash.text.StaticText;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import sglib.core.constant.LoadStatus;
	import sglib.core.constant.VisualStatus;
	import sglib.core.gen.newLoaderGraphic;
	import sglib.core.gen.newTextField;
	import sglib.core.gen.newVisualGraphic;
	import sglib.core.infs.load.ILoaderGraphic;
	import sglib.core.infs.visual.IVisualGraphic;
	import sglib.core.utils.display.Highlighter;
	import sglib.display.base.VisualGraphic;
	import sglib.service.load.ForcibleLoader;
	import sglib.service.load.LoaderGraphic;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 18 May 2010 (0.1.0)
	 */
	public class HighlighterTest extends Test
	{
		protected var hlt 	: Highlighter;
		
		protected var x1	: int;
		protected var y1	: int;
		protected var ld	: Loader;
		
		public function HighlighterTest() 
		{
			hlt = new Highlighter();
			
			//var a : LoaderGraphic;
			//var ld : ILoaderGraphic = newLoaderGraphic();
			//ld.onLoadStatus(onStatus, [ld]);
			//ld.startLoad('contents.swf');
			ld = new Loader();
			addChild(ld);
			var a : ForcibleLoader = new ForcibleLoader(ld);
			a.load(new URLRequest('flash6.swf'));
			ld.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			//ld.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		private function onComplete(e:Event):void 
		{
			trace('completed');
			hlt.container = ld.content;
		}
		
		private function onMouseUp(e:Event):void 
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.removeEventListener(Event.MOUSE_LEAVE, onMouseUp);
			stage.removeEventListener(Event.ENTER_FRAME, _onEnterFrame1);
			hlt.highlighRect(x1, y1, hlt.container.mouseX, hlt.container.mouseY);
		}
		
		private function onMouseDown(e:MouseEvent):void 
		{
			hlt.container = ld.content;
			x1 = hlt.container.mouseX;
			y1 = hlt.container.mouseY;
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(Event.MOUSE_LEAVE, onMouseUp);
			stage.addEventListener(Event.ENTER_FRAME, _onEnterFrame1);
		}
		
		protected function _onEnterFrame1(e:Event):void 
		{
			hlt.highlighRect(x1, y1, hlt.container.mouseX, hlt.container.mouseY);
		}
		
		//private function onStatus(vo: LoaderGraphic):void
		//{
			//if (vo.loadStatus.value == LoadStatus.COMPLETED) {
				//addChild(vo.loadContent);
				//hlt.container = vo.loadContent;
				//
				//hlt.highlightText('sơn ca');
			//}
		//}
		
	}

}