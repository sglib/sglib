package sglib.service.load 
{
	import flash.events.AsyncErrorEvent;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	import sglib.core.data.Numeric;
	import flash.net.NetStream;
	import sglib.core.infs.load.ILoaderVideo;
	import sglib.core.infs.play.IPlayer;
	import sglib.core.infs.play.IPlayerVideo;
	import sglib.core.utils.Frame;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public class LoaderVideo extends LoaderBase implements ILoaderVideo
	{
		/**
		 * 	FMS OR RED5 ONLY
		 **/
		protected var _server	: String;
		protected var _isHTTP	: Boolean;
		protected var _isMp4	: Boolean; /* MP4 or FLV */
		protected var _offset	: Number;
		
		protected var _ns		: NetStream;
		protected var _nc		: NetConnection;
		
		protected var _metadata	: Object;
		protected var _buffering: Boolean;
		protected var _buffer	: Numeric;
		protected var _player	: IPlayerVideo;
		
		public function LoaderVideo() 
		{
			_nc = new NetConnection();
			_nc.addEventListener(AsyncErrorEvent.ASYNC_ERROR, _onError);
			_nc.addEventListener(IOErrorEvent.IO_ERROR, _onError);
			_nc.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _onError);
			
			setServer(null);
			
			_buffer = new Numeric();
		}
		
		override public function set url(value:String):void 
		{
			super.url = value;
			_metadata = null;
		}
		
	/******************************
	 *	INTERNAL FUNCTIONALITY
	 *****************************/
		
		override protected function _start():void 
		{
			//TODO : take _offset into account
			_ns.play(busterURL);
			_ns.bufferTime = 5;
			_ns.pause(); // auto pause
			_ns.seek(0); // prevent the fast forward bug (snap to the next cue-point)
		}
		
		override protected function _stop():void 
		{
			_ns.pause();
			_ns.close(); // try catch ?
		}
		
		override protected function _addLsn(pdispatcher:IEventDispatcher = null):void 
		{
			Frame.onEnter(_onEnterFrame, null, false);
			
			_ns.addEventListener(AsyncErrorEvent.ASYNC_ERROR, _onError);
			_ns.addEventListener(IOErrorEvent.IO_ERROR, _onError);
		}
		
		override protected function _remLsn(pdispatcher:IEventDispatcher = null):void 
		{
			Frame.remove(_onEnterFrame);
			
			_ns.removeEventListener(AsyncErrorEvent.ASYNC_ERROR, _onError);
			_ns.removeEventListener(IOErrorEvent.IO_ERROR, _onError);			
		}
		
		override public function set iPlayer(pplayer: IPlayer): void {
			_player = pplayer as IPlayerVideo;
		}
		
	/******************************
	 * 		EVENT HANDLERS
	 *****************************/	
		
		
		private function _onEnterFrame():void
		{
			_progress.value = _ns.bytesLoaded / _ns.bytesTotal;
			if ( _ns.bytesLoaded / _ns.bytesTotal >= 1) _onComplete(null);
		}
		
		private function _onMetaData(info: Object):void
		{
			_metadata = info;
			_onInfo('METADATA');
		}
		
	/******************************
	 *		PUBLIC METHODS
	 *****************************/	
		
		/**
		 * @inheritDoc
		 */
		public function setServer(pserver:String, pHTTP:Boolean = false):ILoaderVideo
		{
			_server = pserver;
			_isHTTP = pHTTP;
			
			//TODO : Gabage collect for old _nc, _ns
			_nc.connect(pserver);
			_ns = new NetStream(_nc);
			_ns.client = {onMetaData : _onMetaData}; /* quick fix */
			
			return this;
		}
		
		
		/**
		 * @inheritDoc
		 */
		public function setTimeOffset(ptime:Number):ILoaderVideo
		{
			_offset = ptime;
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get metadata():Object
		{
			return _metadata;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get player():IPlayerVideo{ return _player}
		
		/**
		 * @inheritDoc
		 */
		public function get stream():NetStream { return _ns; }
		
	}

}