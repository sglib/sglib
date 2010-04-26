package sglib.display.base 
{
	import flash.display.InteractiveObject;
	import sglib.core.data.Group;
	import sglib.core.infs.layout.ILayout;
	import sglib.core.infs.visual.IVisualGroup;
	import sglib.core.infs.visual.IVisualGroup;
	import sglib.core.utils.addChildren;
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
			_group = new Group(_items.length, -1);
			addChildren(_view, _items);
			_width = _layout.width;
			_height = _layout.height;
			
			_layout.refresh(_items);
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