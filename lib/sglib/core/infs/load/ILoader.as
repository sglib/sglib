package sglib.core.infs.load
{
	import flash.system.LoaderContext;
	import sglib.core.data.Info;
	import sglib.core.data.Numeric;
	import sglib.core.data.State;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 26 April 2010 (0.1.0)
	 */
	public interface ILoader
	{
		/**
		 * start the loader for current url
		 * @param	purl change the url before start loading
		 */
		function startLoad(purl: String = null):void;
		
		/**
		 * stop the loading if it's currently loading
		 */
		function stopLoad():void;
		
		
		
		/**
		 * get the current url
		 */
		function get url():String;
		
		/**
		 * set the loading url, this also stop loading the old url
		 */
		function set url(purl: String):void;
		
		
		/**
		 * set cache buster
		 */
		function set cacheBuster(pvaulue: ICacheBuster):void;
		
		
		
		/**
		 * [Bindable] the loading progress, aka, bytesLoaded/bytesTotal
		 */
		function get loadProgress(): Numeric;
		
		/**
		 * [Bindable] loading status IDLE | LOADING | ERROR | COMPLETE
		 */
		function get loadStatus(): State;
		
		/**
		 * [Bindable]
		 */
		function get loadInfo():Info;
		
		
		/**
		 * [HELPER] equivalent to ILoaderGraphic.status.addLsn(phandler, pparams)
		 *  to remove use ILoaderGraphic.status.remLsn(phandler)
		 */
		function onLoadStatus(phandler: Function, pparams: Array = null, once: Boolean = false): ILoader;
		
		/**
		 * [HELPER] equivalent to ILoaderGraphic.progress.addLsn(phandler, pparams)
		 * to remove use ILoaderGraphic.progress.remLsn(phandler)
		 */
		function onLoadProgress(phandler: Function, pparams: Array = null, once: Boolean = false): ILoader;
	}

}