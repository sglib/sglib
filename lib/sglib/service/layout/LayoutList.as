package sglib.service.layout 
{
	import flash.display.DisplayObject;
	import sglib.core.infs.layout.ILayoutList;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class LayoutList extends Layout implements ILayoutList
	{
		protected var gaps		: int;
		protected var ox		: int;
		protected var oy		: int;
		protected var isHorz	: Boolean;
		
		public function refresh(pitems:Array):void 
		{
			var l	: int = pitems.length;
			var o	: DisplayObject;
			var c	: int = (isHorz) ? ox : oy;
			trace(gaps);
			for (var i: int = 0; i < l; i++) {
				o = pitems[i];
				
				if (isHorz) {
					o.x = c;
					if (!isNaN(oy)) o.y = oy; 
					c += o.width + gaps;
				} else {
					o.y = c;
					if (!isNaN(ox)) o.x = ox;
					c += o.height + gaps;
				}
			}
			
			_width = (isHorz) ? c + ox : 0;
			_height = (isHorz) ? 0 : c + oy;
		}
		
		public function config(pgap:int = 0, phorz:Boolean = true, px:int = 0, py:int = 0):ILayoutList
		{
			gaps = pgap; isHorz = phorz; ox = px; oy = py;
			return this;
		}
		
		
	}

}