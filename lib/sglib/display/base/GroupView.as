package sglib.display.base 
{
	import flash.display.InteractiveObject;
	import sglib.core.data.Group;
	import sglib.core.infs.layout.ILayout;
	import sglib.core.infs.visual.IGroupView;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class GroupView extends VisualObject implements IGroupView
	{
		protected var _group	: Group;
		protected var _items 	: Array;
		protected var _layout	: ILayout;
		
		public function GroupView() 
		{
			
		}
		
		public function generateContent(nChild:int, fNew:Function):IGroupView
		{
			var list : Array = [];
			for (var i: int = 0; i < nChild; i++) {
				list.push(fNew(i));
			}
			setContent.apply(null, list);
			return this;
		}
		
		public function setContent(...pchildren):IGroupView
		{
			_items = pchildren;
			
			//trace(_items, _items.length);
			_group = new Group(_items.length, -1);
			_layout.refresh(_items);
			
			for (var i: int = 0; i < _group.total; i++) {
				_view.addChild(_items[i]);
			}
			
			_width = _layout.width;
			_height = _layout.height;
			return this;
		}
		
		public function setLayout(playout:ILayout):IGroupView { 
			_layout = playout; 
			return this;
		}
		
		public function get group():Group { return _group }
		
		
	}

}