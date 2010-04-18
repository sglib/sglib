package sglib.core.utils
{
	import flash.utils.Dictionary;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note 
	 *  	
	 * @update 14 April 2010 (0.1.0)
	 *
	 */
	public class InstanceData
	{
		protected var _dict : Dictionary;
		
		public function InstanceData() {
			_dict = new Dictionary(true); /* use weak reference */
		}
		
		public function add(pinstance:Object, data:*):void
		{
			if (_dict[pinstance]) trace('InstanceData WARNING :: Overwriting data for instance ', pinstance);
			_dict[pinstance] = data;
		}
		
		public function remove(pinstance:Object):void
		{
			delete _dict[pinstance];
		}
		
		public function of(pinstance:Object):*
		{
			return _dict[pinstance]
		}
		
		
	}

}