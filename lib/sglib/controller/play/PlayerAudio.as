package sglib.controller.play 
{
	import flash.events.Event;
	import flash.media.SoundChannel;
	import sglib.core.constant.LoadStatus;
	import sglib.core.constant.PlayStatus;
	import sglib.core.gen.newLoaderAudio;
	import sglib.core.infs.load.ILoader;
	import sglib.core.infs.load.ILoaderAudio;
	import sglib.core.infs.load.ILoaderInternal;
	import sglib.core.infs.play.IPlayerAudio;
	
	import sglib.core.utils.Frame;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note 
	 *  	
	 * @update 14 April 2010 (0.1.0)
	 *
	 */
	public class PlayerAudio extends Player implements IPlayerAudio
	{
		protected var _loader	: ILoaderAudio;
		protected var _channel	: SoundChannel;
		
		public function PlayerAudio(ploader : ILoaderAudio = null) 
		{
			_loader = ploader ? ploader : newLoaderAudio();
			(_loader as ILoaderInternal).iPlayer = this;
			
			if (_loader.loadStatus.value == LoadStatus.COMPLETED) {
				_duration = _loader.sound.length/1000;//the correct duration only available when the loading is completed
			} else {
				_loader.onLoadStatus(_onLoadStatus);
			}
		}
		
		private function _onLoadStatus():void
		{
			if (_loader.loadStatus.value == LoadStatus.COMPLETED) {
				_duration = _loader.sound.length/1000;//the correct duration only available when the loading is completed
				_loader.loadStatus.remLsn(_onLoadStatus);
			}
		}
		
	/******************************
	 *	INTERNAL FUNCTIONALITY
	 *****************************/	
		
		override protected function _play():void 
		{
			updateChannel(_channel ? _channel.position / 1000 : 0);//resume playing or start from 0
			_seekable = true;
			Frame.onEnter(_onProgress, null, false);
		}
		
		override protected function _pause():void 
		{
			Frame.remove(_onProgress);
			_channel.stop();
		}
		
		override protected function _stop():void 
		{
			Frame.remove(_onProgress);
			_channel.stop();
			updateChannel(0);
		}
		
		override protected function _onSetVolume():void 
		{
			super._onSetVolume();
			_channel.soundTransform = _soundTransform;
		}
		
		protected function updateChannel(time: Number): void {//why should we need to create a new channel to resume/seek ???
			if (_channel) {
				_channel.removeEventListener(Event.SOUND_COMPLETE, _onEnd);
				_channel.stop();
			}
			
			_channel = _loader.sound.play(time * 1000, 0, _soundTransform);
			_channel.addEventListener(Event.SOUND_COMPLETE, _onEnd);
		}
		
		override protected function get iloader():ILoader { return _loader; }
		
	/******************************
	 * 		EVENT HANDLERS
	 *****************************/
		
		override protected function _seek(time:Number):void 
		{
			updateChannel(time);
			if (playStatus.value != PlayStatus.PLAY) _channel.stop();
			_onSeek();
		}
		
		protected function _onProgress(): void {
			_progress.value = (_duration > 0) ? _channel.position / _duration / 1000 : 0;
		}
		
	/******************************
	 * 		PUBLIC METHODS
	 *****************************/
		
		/**
		 * @inheritDoc
		 */
		public function get loader():ILoaderAudio { return _loader; }
	}

}