package sglib.service.load 
{
	import flash.display.AVM1Movie;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.SecurityDomain;
	import flash.utils.Dictionary;
	import sglib.core.constant.LoadStatus;
	import sglib.core.infs.load.IGraphicCacher;
	import sglib.core.infs.load.ILoaderGraphic;
	import sglib.core.infs.play.IPlayer;
	import sglib.core.infs.play.IPlayerGraphic;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 05 May 2010 (0.1.0)
	 */
	public class LoaderGraphic extends LoaderBase implements ILoaderGraphic
	{
		protected var _context		: LoaderContext;
		protected var _reuse		: Boolean; /* reuse Loader instance or not */
		protected var _smooth		: Boolean = true; /* smooth bitmap or not */
		
		protected var _loader		: Loader;
		protected var _content		: DisplayObject;
		protected var _unloading	: Boolean; /* is unloading file */
		protected var _player		: IPlayerGraphic;
		
		protected var _cacher		: IGraphicCacher;
		protected var _isCached		: Boolean;
		
		public function LoaderGraphic() 
		{
			
		}
		
	/******************************
	 *	INTERNAL FUNCTIONALITY
	 *****************************/
		
		override protected function _start():void 
		{
			if (_reuse && _unloading) return; //do pending action only when using the same loader && is unloading
			_loader.load(new URLRequest(busterURL), _context);
		}
		
		override protected function _stop():void 
		{
			_unloading = _loader.content != null;
			if (_unloading) {
				_loader.contentLoaderInfo.addEventListener(Event.UNLOAD, _onUnload);
				_loader.unload();
			} // else ???
			
			try {
				_loader.close();
				//flash 10's new API - _loader.unloadAndStop();
			} catch (e:Error) { }
		}
		
		override public function startLoad(purl:String = null):void 
		{
			if (purl != null) url = purl;
			if (_status.value == LoadStatus.IDLE || _status.value == LoadStatus.ERROR) { /* LoadStatus.COMPLETE : calling start won't restart loading */
				_isCached = false;
				if (_cacher) {
					_content = _cacher.fromURL(_url);
					_isCached = _content != null;
					if (_isCached) _onComplete(null);/* dispatch event */
				}
				
				if (!_isCached) {
					_addLsn();
					_start();
					_status.value = LoadStatus.LOADING;
					_progress.value = 0; /* reset _progress */
				}
			}
		}
		
		override protected function _addLsn(pdispatcher:IEventDispatcher = null):void 
		{
			if (!_reuse || !_loader) _loader = new Loader();
			var li : LoaderInfo = _loader.contentLoaderInfo;
			li.addEventListener(Event.OPEN, 					_onInfo);
			li.addEventListener(Event.INIT, 					_onInfo);
			li.addEventListener(HTTPStatusEvent.HTTP_STATUS,	_onInfo);
			super._addLsn(li);
		}
		
		override protected function _remLsn(pdispatcher:IEventDispatcher = null):void 
		{
			var li : LoaderInfo = _loader.contentLoaderInfo;
			li.removeEventListener(Event.OPEN, 					_onInfo);
			li.removeEventListener(Event.INIT, 					_onInfo);
			li.removeEventListener(HTTPStatusEvent.HTTP_STATUS,	_onInfo);
			
			super._remLsn(li);
		}
		
		override public function set iPlayer(pplayer: IPlayer): void {
			//_player = pplayer as IPlayerVideo;
		}
		
	/******************************
	 * 		EVENT HANDLERS
	 *****************************/
		
		private function _onUnload(e:Event):void 
		{
			_unloading = false;
			/* There can be case when _reuseLoader == false, means that the current _loader is not the one we are trying to unload */
			e.target.removeEventListener(Event.UNLOAD, _onUnload);
			if (_status.value == LoadStatus.LOADING && e.target == _loader) _start(); /* resume only when using same loader */
		}
		
		override protected function _onComplete(e:Event):void 
		{
			if (!_isCached) {
				_remLsn();
				_content = _loader.content;
				if (_cacher) _cacher.setURL(_url, _content); //register
			}
			_progress.value = 1;
			_status.value = LoadStatus.COMPLETED;
		}
		
	/******************************
	 *		PUBLIC METHODS
	 *****************************/	
		
		/**
		 * @inheritDoc
		 */
		public function context(pcheckPolicy : Boolean = false, pappDomain: ApplicationDomain = null, psecurDomain: SecurityDomain = null ):ILoaderGraphic 
		{
			_context = new LoaderContext(pcheckPolicy, pappDomain, psecurDomain);
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function set cacher(pcacher:IGraphicCacher):void
		{
			_cacher = pcacher;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get player():IPlayerGraphic { return _player; }
		
		/**
		 * @inheritDoc
		 */
		public function set reuseLoader(pvalue:Boolean):void { _reuse = pvalue; }
		
		/**
		 * @inheritDoc
		 */
		//public function set smoothBitmap(pvalue:Boolean):void { _smooth = pvalue; }
		
		/**
		 * @inheritDoc
		 */
		public function get loadContent():DisplayObject { return _content }
		
		public function get cacher():IGraphicCacher { return _cacher; }
		
		/**
		 * @inheritDoc
		 */
		//public function get contentAsMovieClip():MovieClip { return (_loader && _loader.content) ? _loader.content as MovieClip : null; }
		
		/**
		 * @inheritDoc
		 */
		//public function get contentAsBitmap():Bitmap { return (_loader && _loader.content) ? _loader.content as Bitmap : null; }
		
		/**
		 * @inheritDoc
		 */
		//public function get contenAsAVM1():AVM1Movie { return (_loader && _loader.content) ? _loader.content as AVM1Movie : null; }
		
	}

}