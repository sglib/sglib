﻿package sglib.service.layout 
{
	import flash.display.DisplayObject;
	import sglib.core.infs.layout.ILayoutGrid;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class LayoutGrid extends Layout implements ILayoutGrid
	{
		protected var gridW	: int;
		protected var gridH	: int;
		protected var n		: int;
		protected var ox	: int;
		protected var oy	: int;
		
		protected var isHorz	: Boolean;
		
		public function LayoutGrid() 
		{
			n = 1;
		}
		
		public function config(pw:int, ph:int, pn:int, phorz:Boolean = false, px:int = 0, py:int = 0):ILayoutGrid
		{
			gridW	= pw;
			gridH	= ph;
			n	= pn;
			isHorz = phorz;
			ox	= px;
			oy	= py;
			return this;
		}
		
		public function refresh(pitems:Array):void 
		{
			var l	: int = pitems.length;
			var o	: DisplayObject;
			
			for (var i: int = 0; i < l; i++) {
				o = pitems[i];
				
				if (isHorz) {
					o.x = int(i / n) * gridW + ox;
					o.y = (i % n) * gridH + oy;
				} else {
					o.x = (i % n) * gridW + ox;
					o.y =  int(i / n) * gridH + oy;
				}	
			}
			
			_width = (isHorz) ? int(l / n) * gridW +2 * ox : (l % n) * gridH + 2 * oy;
			_height = (!isHorz) ? int(l / n) * gridW +2 * ox : (l % n) * gridH + 2 * oy;			
		}
		
	}

}