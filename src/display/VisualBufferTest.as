package display 
{
	import flash.display.ActionScriptVersion;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import sglib.core.data.Group;
	import sglib.core.data.Numeric;
	import sglib.core.infs.visual.IVisualBuffer;
	import sglib.core.utils.drwRect;
	import sglib.core.utils.math.pct2Val;
	import sglib.display.base.VisualBuffer;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public class VisualBufferTest extends Test
	{
		protected var bv		: IVisualBuffer;
		protected var position	: Numeric;
		
		protected var n			: int = 400;
		protected var l			: int = 20;
		
		public function VisualBufferTest() 
		{
			bv = newVisualBuffer();
			addChild(bv.view);
			
			var arr : Array = [];
			for (var i: int = 0; i < l; i++) {
				arr.push(newItem());
			}
			
			bv.position = position = new Numeric(0);
			bv.setConfig(arr, n, updateItem);
		}
		
		override protected function _onEnterFrame(e:Event):void 
		{
			var pct : Number = stage.mouseX / (stage.stageWidth-1);
			
			position.value = pct;	
			bv.view.y =  -int(bv.pos * 20);
		}
		
		protected function updateItem(itm: Sprite, id: int): void {
			(itm.getChildAt(0) as TextField).text = '' + id;
			itm.y = 20 * id;
		}
		
		protected function newItem(): Sprite  {
			var mc : Sprite;
			drwRect(mc = new Sprite(), 0x0000ff, 100, 20);
			mc.addChild(new TextField());
			mc.mouseChildren = false;
			return mc;
		}
		
	}

}