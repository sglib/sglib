package sglib.service 
{
	import sglib.core.constant.MenuItemStatus;
	import sglib.core.data.Group;
	import sglib.core.infs.menu.IMenu;
	import sglib.core.infs.menu.IMenuItem;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public class Menu implements IMenu
	{
		protected var _parent 	: IMenuItem;
		protected var _children	: Array;
		protected var _group	: Group;
		
		public function Menu() 
		{
			_group = new Group();
			_group.addLsn(_onChangedActive);
		}
		
		protected function _onChangedActive():void {
			var mi : IMenuItem;
			
			if (_group.lastActive != -1) {
				mi = _children[_group.lastActive];
				if (mi.status.value != MenuItemStatus.DISABLE) mi.status.value = MenuItemStatus.INACTIVE;
			}
			
			if (_group.active != -1) {
				mi = _children[_group.active];
				if (mi.status.value != MenuItemStatus.DISABLE) mi.status.value = MenuItemStatus.ACTIVE;
				//else : return last active ? or -1 ?
			}
		}
		
		public function get parent():IMenuItem { return _parent }
		
		public function get children():Array { return _children }
		
		public function get group():Group { return _group }
		
		
		public function show():void {
			//update height, call parent's size update
		}
		
		public function hide():void { 
			//update height, call parent's size update
		}
		
	}

}