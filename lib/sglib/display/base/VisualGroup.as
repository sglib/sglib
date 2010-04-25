package sglib.display.base 
{
	import flash.display.InteractiveObject;
	import sglib.core.data.Group;
	import sglib.core.infs.layout.ILayout;
	import sglib.core.infs.visual.IVisualGroup;
	import sglib.core.infs.visual.IVisualGroup;
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
		
		public function VisualGroup() 
		{
			
		}
		
		public function setContent(pchildren: Array):IVisualGroup
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
		
		public function setLayout(playout:ILayout):IVisualGroup { 
			_layout = playout; 
			return this;
		}
		
		public function get group():Group { return _group }
		
		
	}

}