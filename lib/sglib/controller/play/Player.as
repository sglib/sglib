package sglib.controller.play 
{
	import flash.events.Event;
	import flash.media.SoundTransform;
	import sglib.core.constant.LoadStatus;
	import sglib.core.constant.PlayStatus;
	import sglib.core.data.Info;
	import sglib.core.data.State;
	import sglib.core.data.Numeric;
	import sglib.core.infs.ILoader;
	import sglib.core.infs.IPlayer;
	import sglib.core.infs.IPlayerInternal;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note 
	 *  	
	 * @update 14 April 2010 (0.1.0)
	 *
	 */
	public class Player implements IPlayer, IPlayerInternal
	{
		protected var _duration : Number;
		
		protected var _progress : Numeric;
		protected var _buffer	: Numeric;
		protected var _volume	: Numeric;
		protected var _status	: State;
		protected var _info		: Info;
		
		protected var _seekable : Boolean;
		protected var _seekPend	: Number;
		
		protected var _playOnSeek 		: Boolean; /* auto play on seek */
		protected var _stopLoader		: Boolean = true; /* auto stop loader when calling player.stop */
		protected var _soundTransform	: SoundTransform;
		
		
		public function Player() 
		{
			_progress = new Numeric();
			_volume = new Numeric(0.8);
			_status = new State(PlayStatus.STOP);
			
			_soundTransform = new SoundTransform(0.8);
			_volume.addLsn(_onSetVolume);
		}
		
	/******************************
	 *	INTERNAL FUNCTIONALITY
	 *****************************/	
		
		protected function _play():void
		{
			
		}
		
		protected function _pause():void
		{
			
		}
		
		protected function _stop():void
		{
			
		}
		
		protected function _seek(time: Number): void {
			
		}
		
		protected function _onSetVolume():void
		{
			_soundTransform.volume = _volume.value;
		}
		
		protected function get iloader(): ILoader {
			trace('Player.get loader need to be overriden !');
			return null; /* decendant need to overwrite this */
		}
		
	/******************************
	 * 		EVENT HANDLERS
	 *****************************/
		
		protected function _onSeek(): void {
			_seekable = true;
			if (_seekPend != -1) seek(_seekPend);//resume pending seek
		}
		
		protected function _onEnd(e: Event = null):void {
			_status.value = PlayStatus.END;
		}
	
	/******************************
	 *		PUBLIC METHODS
	 *****************************/	
		
		/**
		 * @inheritDoc
		 */
		public function play(purl:String = null, preset:Boolean = false):void
		{
			if (_status.value != PlayStatus.PLAY && _status.value != PlayStatus.BUFFER) {
				if (purl || iloader.loadStatus.value == LoadStatus.IDLE) iloader.startLoad(purl);//new file or not yet load ? 
				
				if (preset) {
					_seekPend = -1; /* remove pending seek, if any */
					_seek(0); /* No need to change / check state - What if it's currently non-seekable ? */
				}
				_play();
				_status.value = PlayStatus.PLAY; 
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function pause():void
		{
			if (_status.value == PlayStatus.PLAY || _status.value == PlayStatus.BUFFER) {
				_pause();
				_status.value = PlayStatus.PAUSE;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function toggle():void
		{
			(_status.value == PlayStatus.PLAY || _status.value == PlayStatus.BUFFER) ? pause() : play();
		}
		
		/**
		 * @inheritDoc
		 */
		public function stop():void
		{
			if (_status.value != PlayStatus.STOP) {
				_stop();
				_status.value = PlayStatus.STOP;
				if (_stopLoader) iloader.stopLoad(); //also stop loader
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function seek(ptime:Number):void
		{
			if (_status.value == PlayStatus.STOP) iloader.startLoad();
			if (_playOnSeek) play();
			
			if (_seekable) {
				_seekPend = -1; /* remove seekPend */
				_seekable = false;
				_seek(ptime);				
			} else {
				_seekPend = ptime;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function get buffer():Numeric { return _buffer; }
		
		/**
		 * @inheritDoc
		 */
		public function onPlayStatus(phandler:Function, pparams:Array = null, ponce:Boolean = false):IPlayer
		{
			_status.addLsn(phandler, pparams, ponce);
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function onPlayProgress(phandler:Function, pparams:Array = null, ponce:Boolean = false):IPlayer
		{
			_progress.addLsn(phandler, pparams, ponce);
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get playInfo():Info { return _info; }
		
		/**
		 * @inheritDoc
		 */
		public function get duration():Number { return _duration; }
		
		/**
		 * @inheritDoc
		 */
		public function set duration(pvalue:Number):void { _duration = pvalue }
		
		/**
		 * @inheritDoc
		 */
		public function get playProgress():Numeric { return _progress; }
		
		/**
		 * @inheritDoc
		 */
		public function get volume():Numeric { return _volume; }
		
		/**
		 * @inheritDoc
		 */
		public function get playStatus():State { return _status }
		
	}

}