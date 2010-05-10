package sglib.display.base 
{
	import flash.display.Bitmap;
	import flash.events.AsyncErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.net.ObjectEncoding;
	import sglib.core.data.Numeric;
	import sglib.core.infs.visual.IVisualWebcam;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public class VisualWebcam extends VisualObject implements IVisualWebcam
	{
		protected var _camera      	: Camera;
		protected var _microphone	: Microphone;
		protected var _video        : Video;
		
		protected var _nc         	: NetConnection;
		protected var _ns 			: NetStream;
		protected var _vName		: String;
		
		public function VisualWebcam() 
		{
			
		}
		
		public function setConfig(pw:int, ph:int, pfps:Number = 15):IVisualWebcam
		{
			_microphone = Microphone.getMicrophone();
			_camera = Camera.getCamera();
			_camera.setMode(pw, ph, pfps);
			
			_nc = new NetConnection();
			
			if (_camera == null) {
					_onError('No WebCamera found');
			} else {
					if (_video && _video.parent) {//TODO :: dispose old _video
						
					}
					
					_video = new Video(pw, ph);
					_video.attachCamera(_camera);
					
					_video.scaleX = -1; //considering registration point
					_video.x = _video.width;
					_view.addChild(_video);
					
					//update content
					_width = pw;
					_height = ph;
					
					_nc.objectEncoding = ObjectEncoding.AMF0;
					_nc.addEventListener(NetStatusEvent.NET_STATUS, netStatus);
					_nc.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _onError);
					_nc.addEventListener(AsyncErrorEvent.ASYNC_ERROR, _onError);
					_nc.client = this;
					
					//_ns = new NetStream(_nc);
					//_ns.addEventListener(NetStatusEvent.NET_STATUS, netStatus);
			}
			return this;
		}
		
		public function shot():Bitmap
		{
			return null;
		}
		
		public function startRecord(pserver: String, pname:String):IVisualWebcam
		{
			_vName = pname;
			_nc.connect(pserver);//210.245.123.151 //"rtmp://hocvieniq.com/oflaDemo"
			_ns.attachCamera(_camera);
			_ns.attachAudio(_microphone);
			_ns.publish(pname, "record");
			return this;
		}
		
		public function stopRecord():IVisualWebcam
		{
			_ns.publish(_vName, "record");
			return this;
		}
		
		private function _onError(s: *):void
		{
			trace(this, s);
		}
		
		public function goStream(): void {
			_ns = new NetStream(_nc);//_ns.client = this;
			_ns.addEventListener(NetStatusEvent.NET_STATUS, netStatus);
		}
		
		// Switch Net Status Events
		public function netStatus(evt:NetStatusEvent):void {
			//trace(this, evt.info.code);
			 switch (evt.info.code) {
				case "NetConnection.Connect.Closed"		: break;
                case "NetConnection.Connect.Success"	: goStream(); break;
				case "NetConnection.Connect.Failed"		: break;
            }               
		}
	}

}