package sglib.display.base 
{
	import flash.display.InteractiveObject;
	import sglib.core.data.Group;
	import sglib.core.infs.layout.ILayout;
	import sglib.core.infs.visual.IVisualGroup;
	import sglib.core.infs.visual.IVisualGroup;
	import sglib.core.utils.display.addChildren;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class VisualGroup extends VisualObject implements IVisualGroup
	{
		protected var _group	: Group;
		protected var _items 	: Array;
		protected var _layout	: ILayout;
		protected var _layoutItems	: Array;
		
		public function VisualGroup() 
		{
			
		}
		
		public function setContent(pchildren: Array):IVisualGroup
		{
			_items = pchildren;
			_group = new Group(_items.length, -1);
			
			_layoutItems = [];
			for (var i: int = 0; i < _group.total; i++) {
				if (_items[i].parent == null) {//ignore position of timeline put items
					_layoutItems.push(_items[i]);
				}
			}
			if (_layoutItems.length == _items.length) _layoutItems = _items;
			
			addChildren(_view, _items);
			_width = _layout.width;
			_height = _layout.height;
			
			if (_layout) _layout.refresh(_layoutItems);			
			return this;
		}
		
		public function setLayout(playout:ILayout):IVisualGroup { 
			_layout = playout; 
			return this;
		}
		
		public function get items():Array { return _items }
		
		public function get group():Group { return _group }
		
	}

}