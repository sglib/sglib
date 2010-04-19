package sglib.display.base 
{
	import flash.media.Video;
	import sglib.core.constant.VisualStatus;
	import sglib.core.gen.newPlayerVideo;
	import sglib.core.infs.load.ILoaderVideo;
	import sglib.core.infs.play.IPlayerVideo;
	import sglib.core.infs.visual.IVisualVideo;
	/**
	 * @version 0.1.0
	 * @author thienhaflash
	 * @note 
	 * 
	 * @update 14 April 2010 (0.1.0)
	 */
	public class VisualVideo extends VisualObject implements IVisualVideo	{
		
		protected var _loader	: ILoaderVideo;
		protected var _player	: IPlayerVideo;
		protected var _video	: Video;
		
		public function VisualVideo(pplayer : IPlayerVideo = null) {
			_player = pplayer ? pplayer : newPlayerVideo();//instantiate('sglib.controller.play.PlayerVideo') as IPlayerVideo;
			_loader = _player.loader;
			
			_video = new Video();
			_view.addChild(_video);
			_video.attachNetStream(_loader.stream); /* what if the stream changed ? */
			
			_width = 320;
			_height = 240;
		}
		
		override protected function _updateReg():void 
		{
			_regAlign(_video);
		}
		
		public function get asLoader():ILoaderVideo {  return _loader }
		
		public function get asPlayer():IPlayerVideo {  return _player }
		
		public function get url():String { return _loader.url }
		
		public function set url(purl:String):void { _player.play(purl) }
		
	}

}