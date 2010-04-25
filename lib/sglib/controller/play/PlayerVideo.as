package sglib.controller.play 
{
	import sglib.core.gen.newLoaderVideo;
	import sglib.core.infs.load.ILoader;
	import sglib.core.infs.load.ILoaderInternal;
	import sglib.core.infs.load.ILoaderVideo;
	import sglib.core.infs.play.IPlayerVideo;
	import sglib.core.utils.Frame;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note 
	 *  	
	 * @update 14 April 2010 (0.1.0)
	 *
	 */
	public class PlayerVideo extends Player implements IPlayerVideo
	{
		protected var _loader	: ILoaderVideo;
		protected var _position	: Number;
		
		public function PlayerVideo(ploader: ILoaderVideo = null) 
		{
			_loader = ploader ? ploader : newLoaderVideo();//instantiate('sglib.service.load.LoaderVideo') as ILoaderVideo
			(_loader as ILoaderInternal).iPlayer = this;
			_loader.loadInfo.addLsn(_onLoaderInfo);
			_position = 0;
		}
		
		private function _onLoaderInfo():void
		{
			if (_loader.loadInfo.value=='METADATA') {
				_duration = _loader.metadata.duration || 0;
			}
		}
		
	/******************************
	 *	INTERNAL FUNCTIONALITY
	 *****************************/	
		
		override protected function _play():void 
		{
			_loader.stream.play(_loader.url);
			if (_position > 0) _seek(_position);
			Frame.onEnter(_onProgress, null, false);
		}
		
		override protected function _pause():void 
		{
			_position = _loader.stream.time;
			Frame.remove(_onProgress);
			_loader.stream.pause();
		}
		
		override protected function _stop():void 
		{
			Frame.remove(_onProgress);
			_loader.stream.pause();
			_seek(0);
			_position = 0;
		}
		
		override protected function _onSetVolume():void 
		{
			super._onSetVolume();
			_loader.stream.soundTransform = _soundTransform;
		}
		
		override protected function get iloader():ILoader { return _loader; }
		
		public function get loader():ILoaderVideo { return _loader; }
		
		//private function _onNetStatus(e:NetStatusEvent):void 
		//{
			//trace(e.info.code, _ns.bufferLength/_ns.bufferTime);
			//
			//switch (e.info.code) {
				//case 'NetStream.Buffer.Empty'://if (_status.state == LOADING) buffer.value = 0; 
					//_onInfo(null);
					//break;
				//case 'NetStream.Buffer.Full' ://if (_status.state == LOADING) buffer.value = 1;
					//_onInfo(null);
					//break;
			//}
			//
		//}
		
		//private function _onMetaData(info:Object):void {
			//for (var i: String in info) {
				//trace('onMetaData : ', i, " : ", info[i]);
			//}
			//_metaData = info;
			//_onInfo(null);
		//}
		//
		//private function _onPlayStatus(info:Object):void {
			//for (var i: String in info) {
				//trace('onPlayStatus : ', i, " : ", info[i]);
			//}
			//_onInfo(null);
		//}
		//
		//private function _onCuePoint(info:Object):void {
			//trace(info.time);
			//trace("cuepoint: time=" + info.time + " name=" + info.name + " type=" + info.type);
			//_onInfo(null);
		//}
		//
		//private function _onLastSecond(info: Object ):void{
			//for (var i: String in info) {
				//trace('onLastSecond : ',i, info[i]);
			//}
			//_onInfo(null);
		//}
		
	/******************************
	 * 		EVENT HANDLERS
	 *****************************/
		
		override protected function _seek(time:Number):void 
		{
			_loader.stream.seek(time);
			_position = _loader.stream.time;
			_seekable = true;
			//Frame.onEnter(_onSeek); /* fake :: seek won't complete next frame, check for netstatus instead */
		}
		
		protected function _onProgress(): void {
			_progress.value = (_duration > 0) ? _loader.stream.time / _duration : 0;
		}
	}

}