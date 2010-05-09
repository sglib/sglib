package sglib.service.load 
{
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.text.StyleSheet;
	import sglib.core.infs.load.ILoaderData;
	import sglib.core.utils.copyObj;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 09 May 2010 (0.1.0)
	 */
	public class LoaderData extends LoaderBase implements ILoaderData
	{
		protected var _loader		: URLLoader;
		protected var _variables	: URLVariables;
		
		public function LoaderData() 
		{
			_loader = new URLLoader();
		}
		
		override protected function _start():void 
		{
			var request : URLRequest = new URLRequest(busterURL);//wil busterURL work well with URLVariables ?
			if (_variables) {
				request.data = _variables;
				request.method = URLRequestMethod.POST;	
				_variables = null; //is this nullize neccessary ?
			}
			_loader.load(request);
		}
		
		override protected function _stop():void 
		{
			try {
				_loader.close();
			} catch (e: Error) { };
		}
		
		override protected function _addLsn(pdispatcher:IEventDispatcher = null):void 
		{
			super._addLsn(_loader);
			_loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, _onInfo);
			_loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _onError);
		}
		
		override protected function _remLsn(pdispatcher:IEventDispatcher = null):void 
		{
			super._remLsn(_loader);
			_loader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, _onInfo);
			_loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, _onError);
		}
		
		public function setVariables(pvariables:Object):ILoaderData
		{
			_variables = new URLVariables();
			copyObj(_variables, pvariables);
			return this;
		}
		
		public function get data():* { return _loader.data;	}
		
		public function get dataAsXML():XML { return XML(_loader.data); }
		
		public function get dataAsCSS():StyleSheet
		{
			var css : StyleSheet = new StyleSheet();
			css.parseCSS(_loader.data);
			return css;
		}
		
	}

}