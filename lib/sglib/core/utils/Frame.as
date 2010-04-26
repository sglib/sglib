package sglib.core.utils 
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import sglib.core.Callback;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class Frame
	{
		protected static var _callback		: Callback;
		protected static var _heart			: Shape;
		
		public function Frame() 
		{
			
		}
		
		public static function init(): void {
			_callback = new Callback();
			_heart = new Shape();
			_heart.addEventListener(Event.ENTER_FRAME, _dispatch);
		}
		
		private static function _dispatch(e:Event):void 
		{
			_callback.dispatch();
		}
		
		public static function onEnter(f: Function, params: Array = null, once: Boolean = true): void {
			if (!_heart) init();
			_callback.addLsn(f, params, once);
		}
		
		public static function remove(f: Function):void {
			_callback.remLsn(f);
		}
		
	}

}