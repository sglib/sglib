package sglib.core.infs.load
{
	import flash.net.NetStream;
	import sglib.core.data.Numeric;
	import sglib.core.infs.play.IPlayerVideo;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @note	Remember that _ns.bufferTime can report a wrong value (and it's wrong most of the time)
	 * 			Remember that setting _ns.bufferTime > video's duration will make video waits for _ns.bufferTime seconds before playing 
	 * 				even when the video is fully buffered already
	 * 
	 * @update 14 April 2010 (0.1.0)
	 *
	 */
	public interface ILoaderVideo extends ILoader
	{
		/**
		 * [FMS/RED5/HTTP only] set the RED5/FMS/HTTP server URL
		 * [IMPORTANT NOTE] NetStream will be changed after reset ServerURL - be sure to update the using stream after calling setServer
		 * @param	pserver the server url
		 * @param	pHTTP is using HTTP streaming or RED5/FMS
		 * @return	use to chain call with setTimeOffset or start();
		 */
		function setServer(pserver: String, pHTTP: Boolean = false):ILoaderVideo;
		
		/**
		 * [FMS/RED5/HTTP only] set the start load position
		 * @param	ptime (seconds ? ) 
		 * @return use to chain call with start();
		 */
		function setTimeOffset(ptime: Number):ILoaderVideo;
		
		/**
		 * get the currently loading stream
		 */
		function get stream():NetStream;
		
		/**
		 * the player attached to this Video - can be null
		 */
		function get player(): IPlayerVideo;
		
		function get metadata():Object;
	}
	
}