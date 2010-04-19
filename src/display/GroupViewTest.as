package display 
{
	import flash.display.Sprite;
	import sglib.core.gen.newGroupView;
	import sglib.core.gen.newLayoutGrid;
	import sglib.core.gen.newLayoutList;
	import sglib.core.infs.visual.IGroupView;
	import sglib.core.utils.drwRect;
	import sglib.display.base.GroupView;
	import sglib.service.layout.LayoutGrid;
	import sglib.service.layout.LayoutList;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class GroupViewTest extends Test
	{
		protected var _gv : IGroupView;
		
		public function GroupViewTest() 
		{
			//import 
			var a : GroupView;
			var b : LayoutGrid;
			var c : LayoutList;
			
			_gv = newGroupView()
					.setLayout(newLayoutGrid().config(20, 20, 5))
					.generateContent(100, newItem);
			addChild(_gv.view);
			
			_gv = newGroupView()
					.setLayout(newLayoutList().config(5, false))
					.setContent(newItem1, newItem1, newItem1, newItem1, newItem1);
			addChild(_gv.view);
			_gv.view.x = 200;
		}
		
		private function get newItem1(): Sprite {
			return drwRect(new Sprite(), Math.random() * 0xffffff, Math.random() * 20 + 10, Math.random() * 50 + 20) as Sprite;
		}
		
		private function newItem(id: int):Sprite
		{
			return drwRect(new Sprite(), Math.random() * 0xffffff, 15, 15) as Sprite;
		}
		
	}

}