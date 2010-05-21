package sglib.display.base 
{
	import flash.display.IBitmapDrawable;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextLineMetrics;
	import sglib.core.infs.visual.IVisualText;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 18 May 2010 (0.1.0)
	 */
	public class VisualText extends VisualObject implements IVisualText
	{
		protected var _tf		: TextField;
		protected var _text 	: String;
		protected var _hlColor	: int = 0x0ffff00;
		
		public function VisualText() 
		{
		}
		
		public function set textfield(tf:TextField):void 
		{
			_tf = tf;
			
			_tf.autoSize = TextFieldAutoSize.LEFT;
			_tf.selectable = true;
			
			_text = _tf.text;
			_tf.text = _text;/* fix flash's IDE bug : the text value is different from the textfield's text trace(tf.length, tf.text.length)*/
			_tf.wordWrap = true;
			_tf.mouseWheelEnabled = false;
			
			_view.addChild(_tf);
		}
		
		public function highlight(preg:RegExp):IVisualText
		{
			preg.lastIndex = 0;
			var hl : String = preg.exec(_text);
			
			while (hl) {
				highlightPosition(preg.lastIndex-hl.length, preg.lastIndex);
				hl = preg.exec(_text);
			}
			
			return this;
		}
		
		public function highlightText(ptext: String, pcase: Boolean):IVisualText{
			clearHighlight();
			highlight(new RegExp(ptext, pcase ? 'g' : 'gi'));
			return this;
		}
		
		public function highlightPosition(pstart: int, pend: int):IVisualText {
			var l1 : int = _tf.getLineIndexOfChar(pstart);
			var l2 : int = _tf.getLineIndexOfChar(pend);
			
			if (l1 < l2 && (pend-pstart > 1)) {//do recursive
				var off : int = pstart;
				while (off < pend) {
					off++;
					if (_tf.getLineIndexOfChar(off) > l1) break;
				}
				
				trace('end pos :: ', pstart, off);
				highlightPosition(pstart, off);
				
			} else {
				var b1 : Rectangle = _tf.getCharBoundaries(pstart);
				var b2 : Rectangle = _tf.getCharBoundaries(pend - 1);
				
				if (b1 && b2) {
					with (_view.graphics) {
						beginFill(_hlColor);
						drawRect(b1.x + _tf.x - 1, b1.y + _tf.y, b2.x - b1.x + b2.width, b1.height);
						endFill();
					}
				}
			}
			return this;
		}
		
		public function clearHighlight():IVisualText
		{
			_view.graphics.clear();
			return this;
		}
		
		public function setHLColor(pcolor:int):IVisualText
		{
			_hlColor = pcolor;
			return this;
		}
		
		public function setSelection(pstart: int, pend: int): IVisualText {
			_tf.alwaysShowSelection = true;
			_tf.setSelection(pstart, pend == -1 ? _tf.length : pend);
			return this;
		}
		
	}
}


class HighlightData {
	public var text 	: String;
	public var start	: int;
	public var end		: int;
}