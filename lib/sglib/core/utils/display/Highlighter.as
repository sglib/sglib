package sglib.core.utils.display 
{
	import flash.display.AVM1Movie;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.text.TextSnapshot;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 18 May 2010 (0.1.0)
	 */
	public class Highlighter
	{
		protected var _container	: DisplayObjectContainer;
		protected var _text			: String;
		public var tns 				: TextSnapshot;
		
		public function set container(value:DisplayObject):void 
		{			
			_container = value as DisplayObjectContainer;
			tns = _container.textSnapshot;
			
			_text = tns.getText(0, tns.charCount);
		}
		
		public function highlight(preg: RegExp): void {
			preg.lastIndex = 0;
			var hl : String = preg.exec(_text);
			
			while (hl) {
				highlightPosition(preg.lastIndex-hl.length, preg.lastIndex);
				hl = preg.exec(_text);
			}
		}
		
		public function highlightText(ptext: String, pcase: Boolean = false):void {
			clearHighlight();
			highlight(new RegExp(ptext, pcase ? 'g' : 'gi'));
		}
		
		public function highlightPosition(pstart: int, pend: int):void {
			tns.setSelected(pstart, pend, true);
		}
		
		public function highlighRect(x1: Number, y1: Number, x2: Number, y2 : Number): String {
			
			var pos1 : int = tns.hitTestTextNearPos(x1, y1);
			var pos2 : int = tns.hitTestTextNearPos(x2, y2);
			clearHighlight();
			
			if (pos2 == -1) pos2 = _container.mouseY < 0 ? 0 : tns.charCount;
			
			var min : int = pos1 > pos2 ? pos2 : pos1;
			var max : int = pos1 > pos2 ? pos1 : pos2
			var s : String = '';
			
			if (pos1 != pos2) {
				highlightPosition(min, max);
				s = tns.getSelectedText();
			}
			return s;
		}
		
		public function set color(pcolor: int):void {
			tns.setSelectColor(pcolor);
		}
		
		public function get container():DisplayObject { return _container; }
		
		public function clearHighlight():void {
			tns.setSelected(0, tns.charCount, false);
		}
		
	}

}