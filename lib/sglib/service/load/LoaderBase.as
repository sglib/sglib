package sglib.service.load 
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import sglib.core.constant.LoadStatus;
	import sglib.core.data.Info;
	import sglib.core.data.State;
	import sglib.core.data.Numeric;
	import sglib.core.infs.load.ICacheBuster;
	import sglib.core.infs.load.ILoader;
	import sglib.core.infs.load.ILoaderInternal;
	import sglib.core.infs.play.IPlayer;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	internal class LoaderBase implements ILoader, ILoaderInternal
	{
		protected var _progress : Numeric;
		protected var _status	: State;
		protected var _info		: Info;
		
		protected var _url		: String;
		protected var _cacheBuster	: ICacheBuster;
		
		public function LoaderBase() 
		{
			_progress = new Numeric(-1);
			_status = new State(LoadStatus.IDLE);
			_info = new Info();
		}
		
	/******************************
	 *		INTERNAL METHODS
	 *****************************/
		
		protected function _start(): void {
			
		}
		
		protected function _stop(): void {
			
		}
		
		protected function _addLsn(pdispatcher: IEventDispatcher = null):void {
			pdispatcher.addEventListener(Event.OPEN, 					_onInfo);
			pdispatcher.addEventListener(Event.COMPLETE, 				_onComplete);
			pdispatcher.addEventListener(IOErrorEvent.IO_ERROR,			_onError);
			pdispatcher.addEventListener(ProgressEvent.PROGRESS,		_onProgress);
		}
		
		protected function _remLsn(pdispatcher: IEventDispatcher = null):void {
			pdispatcher.addEventListener(Event.OPEN, 					_onInfo);
			pdispatcher.addEventListener(Event.COMPLETE, 				_onComplete);
			pdispatcher.addEventListener(IOErrorEvent.IO_ERROR,			_onError);
			pdispatcher.addEventListener(ProgressEvent.PROGRESS,		_onProgress);
		}
		
		public function set iPlayer(pplayer:IPlayer):void { trace('iPlayer should be overriden by descendants ');  }
		
	/******************************
	 * 		EVENT HANDLERS
	 *****************************/
		
		protected function _onProgress(e:Event = null):void /* with video case, we will update _progress based on EnterFrame event instead of a ProgressEvent */
		{
			if (e is ProgressEvent) _progress.value = (e as ProgressEvent).bytesLoaded / (e as ProgressEvent).bytesTotal;
		}
		
		protected function _onError(e:Event):void 
		{
			trace(this, e);
			_remLsn();
			_status.value = LoadStatus.ERROR;
		}
		
		protected function _onComplete(e:Event):void 
		{
			_progress.value = 1;
			_remLsn();
			_status.value = LoadStatus.COMPLETED;
		}
		
		protected function _onInfo(e:* = null):void 
		{
			_info.setInfo(e, null);
		}
		
	/******************************
	 * 		PUBLIC METHODS
	 *****************************/
		
		/**
		 * @inheritDoc
		 */
		public function set url(purl:String):void
		{
			if (purl != _url) {
				if (_status.value == LoadStatus.LOADING) _stop();
				_url = purl;
				_status.value = LoadStatus.IDLE;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function startLoad(purl:String = null):void
		{
			//trace('calling start load .. ', purl, _status.value);
			if (purl != null) url = purl;
			if (_status.value == LoadStatus.IDLE || _status.value == LoadStatus.ERROR) { /* LoadStatus.COMPLETE : calling start won't restart loading */
				_addLsn();
				_start();
				_status.value = LoadStatus.LOADING;
				_progress.value = 0; /* reset _progress */
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function stopLoad():void
		{
			if (_status.value == LoadStatus.LOADING) {
				_remLsn();
				_stop();
				_status.value = LoadStatus.IDLE;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function onLoadStatus(phandler:Function, pparams:Array = null, ponce:Boolean = false):ILoader
		{
			_status.addLsn(phandler, pparams, ponce);
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function onLoadProgress(phandler:Function, pparams:Array = null, ponce:Boolean = false):ILoader
		{
			_progress.addLsn(phandler, pparams, ponce);
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function set cacheBuster(pvaulue:ICacheBuster):void
		{
			_cacheBuster = pvaulue;
		}
		
		protected function get busterURL():String {
			return (_cacheBuster) ? _cacheBuster.fromURL(url) : url;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get url():String { return _url; }
		
		/**
		 * @inheritDoc
		 */
		public function get loadProgress():Numeric { return _progress }
		
		/**
		 * @inheritDoc
		 */
		public function get loadStatus():State { return _status; }
		
		/**
		 * @inheritDoc
		 */
		public function get loadInfo():Info { return _info; }
		
	}

}