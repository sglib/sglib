package sglib.core
{
	import flash.utils.Dictionary;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note Support only one params array for each callback - multiple calls will overwrite each other
	 *
	 * @feature :
	 * 		add support for secret key dispatch - still can't find a resonable way to use
	 * 		support priority :: really neccessary ! considering support InternalPriority > ExternalPriority
	 * 		Consider adding idle mode + pending action to prevent interfere while dispatching
	 * 		Consider adding cancel / prevent dispatching / change back ....
	 * 		
	 * 
	 * @update 14 April 2010 (0.1.0)
	 * 		Use to replace dispatchers that only has one Event to dispatch
	 * 		Remove the continuosly demands for custom Event for classes
	 * 		Support abitrary number of parameters/types through params Array
	 * 		Support overlap dispatches (calling dispatch() wile dispatching will cancel the currently dispatching dispatch())
	 * 		> 200% faster than the built in EventDispatcher
	 * 
	 */
	public class Callback
	{
		protected var _dict	: Dictionary = new Dictionary();
		protected var _once : Array;
		
		public function Callback() {
			_once = [];
		}
		
		final public function addLsn(f: Function, params: Array = null, once: Boolean = false): void {
			_dict[f] = params;
			if (once) _once.push(f);
		}
		
		final public function remLsn(f: Function): void {
			/** NOTE : don't check if (_dict[f]) before delete _dict[f], cause _dict[f] can be null while f is in _dict **/
			delete _dict[f];//a bit slower than nullize but we need to sacrifice for filesize + simplicity
		}
		
		final public function remAllLsn(): void {
			_dict = new Dictionary();
		}
		
		/* 
		 * there can be case that dispatch() will be called inside callback() by f
		 * _dspChk helps cancel the outter dispatches if any
		 */	
		protected var _isDispatching : Boolean;
		
		final public function dispatch(): void {
			var oldOnce : Array;
			
			if (_once.length > 0) {//only if there is pending items to be removed
				oldOnce = _once;
				_once = []; /* keeps newly added one time listeners */
			}
			
			_isDispatching = true;
			for (var f: * in _dict) {
				if (!_isDispatching) break; /* overlaps dispatch() detected :: just break current dispatch() */
				f.apply(null, _dict[f]);
			}
			_isDispatching = false;
			
			if (oldOnce) {//do remove one time listeners
				var l : int = oldOnce.length;
				for (var i: int = 0 ; i < l; i++) {
					delete _dict[oldOnce[i]];/** NOTE : don't check if (_dict[f]) before delete _dict[f], cause _dict[f] can be null while f is in _dict **/
				}
			}
			
		}
		
	}

}