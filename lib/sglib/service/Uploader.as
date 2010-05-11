package sglib.service 
{
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.FileReference;
	import flash.net.FileReferenceList;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import sglib.core.constant.UploaderInfo;
	import sglib.core.data.Info;
	import sglib.core.data.Numeric;
	import sglib.core.infs.ITask;
	import sglib.core.infs.IUploader;
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public class Uploader implements IUploader
	{
		protected var _server	: String;
		protected var _filters	: Array;
		
		protected var _remFilter		: Boolean;
		protected var _remSize			: Boolean;
		
		protected var _minsize			: Number;
		protected var _maxsize			: Number;
		
		protected var _info				: Info;
		protected var _idDict			: Dictionary;
		protected var _list				: Array;
		protected var _fileRef 			: FileReference;
		protected var _fileList 		: FileReferenceList;
		
		protected var _fileProgress		: Numeric;
		protected var _totalProgress	: Numeric;
		
		protected var _uploadItem		: UploadItem;
		protected var _isUploading		: Boolean;
		
		protected var _bytesUpload		: Number;
		protected var _bytesTotal		: Number;
		
		public function Uploader() 
		{
			_maxsize = Infinity;
			_idDict = new Dictionary();
			_info = new Info();
			_list = [];
			_fileProgress = new Numeric();
			_totalProgress = new Numeric();
		}
		
	/***********************
	 * 	CONFIGURATION
	 **********************/
		
		public function setServer(pserver:String):IUploader
		{
			_server = pserver;
			return this;
		}
		
		public function setFilter(pfilter:Array):IUploader
		{
			_filters = pfilter;
			return this;
		}
		
		public function setSizeLimit(pmin:Number = 0, pmax:Number = Infinity):IUploader
		{
			_minsize = pmin;
			if (pmax != Infinity) _maxsize = pmax;
			return this;
		}
		
		public function autoRemove(pfilter:Boolean, psize:Boolean = true):IUploader
		{
			_remFilter = pfilter;
			_remSize = psize;
			return this;
		}
		
	/***********************
	 * 	INTERNAL METHODS
	 **********************/	
		
		private function getFileId(fr : FileReference): String {
			return fr.name + fr.size + fr.type;
		}
		
		private function isSizeValid(fr: FileReference): Boolean {
			return fr.size >= _minsize && fr.size <= _maxsize;
		}
		
		private function isExtensionValid(fr: FileReference): Boolean {
			//TODO : check for extension
			return true;
		}
		
		private function pushFileRef(fr: FileReference): Boolean {
			var fileId		: String = getFileId(fr);
			var _pushed 	: Boolean;
			
			if (_idDict[fileId]) {//ignore that file : already existed
				_info.setInfo(UploaderInfo.FILE_DUPLICATE, fr);	
			} else {
				var szValid			: Boolean = isSizeValid(fr);
				var exValid			: Boolean = isExtensionValid(fr);
				
				if ((_remSize && !szValid) || (_remFilter && !exValid)) {
					//size not valid && removeOnSizeInvalid
					//filter not valid && removeOnFilterInvalid
					//do nothing
					_info.setInfo(UploaderInfo.FILE_INVALID, fr);
				} else {
					var ui : UploadItem = new UploadItem(fr, szValid && exValid, fileId);
					_idDict[fileId] = ui;
					_list.push(ui);
					_pushed = true;
					
					if (!(szValid && exValid)) _info.setInfo(UploaderInfo.FILE_INVALID, fr); // although we add to the list by the config, we still dispatch an message telling user that this file is not valid
				}
			}
			
			return _pushed;
		}
		
		private function updateUploadBytes(): void {
			var l 	: int = _list.length;
			var ui	: UploadItem;
			var sz 	: Number;
			
			_bytesUpload = 0;
			_bytesTotal = 0;
			
			for (var i: int = 0; i < l; i++) {
				ui = list[i];
				sz = ui.fileRef.size;
				if (ui.isUploaded) _bytesUpload += sz;
				_bytesTotal += sz;
			}
			
			//trace('[bytesUpload, bytesTotal]', _bytesUpload, _bytesTotal);
		}
		
		private function getFirstUploadItem(): void {//save uploadID would be a better solution but can't solve the case when the array being sorted while uploading
			var l 	: int = _list.length;
			
			_uploadItem = null;
			
			for (var i: int = 0; i < l; i++) {
				_uploadItem = _list[i];
				if (!_uploadItem.isUploaded && !_uploadItem.isError) break; //break here
			}
			if (i == l) _uploadItem = null;
		}
		
		private function addUploadLsn(fr: FileReference): void {
			fr.addEventListener(ProgressEvent.PROGRESS, _onProgress);
			fr.addEventListener(Event.COMPLETE, _onComplete);
			fr.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, _onCompleteData);
			fr.addEventListener(IOErrorEvent.IO_ERROR, _onError);
		}
		
		private function remUploadLsn(fr: FileReference): void {
			fr.removeEventListener(ProgressEvent.PROGRESS, _onProgress);
			fr.removeEventListener(Event.COMPLETE, _onComplete);
			fr.removeEventListener(DataEvent.UPLOAD_COMPLETE_DATA, _onCompleteData);
			fr.removeEventListener(IOErrorEvent.IO_ERROR, _onError);
		}
		
	/***********************
	 * 	INTERNAL HANDLERS
	 **********************/
		
		private function _onFileSelect(e:Event):void 
		{
			_fileRef.addEventListener(Event.SELECT, _onFileSelect);
			
			if (pushFileRef(_fileRef)) {//if list really changed
				updateUploadBytes();
				_info.setInfo(UploaderInfo.LIST_CHANGED);
			}
		}
		
		private function _onListSelect(e:Event):void 
		{
			var l : int = _fileList.fileList.length;
			_fileList.removeEventListener(Event.SELECT, _onListSelect);
			
			var _hasPush : Boolean;
			
			for (var i: int = 0; i < l; i++) {
				_hasPush = pushFileRef(_fileList.fileList[i]) || _hasPush; // it's not _hasPush || pushFileRef !!!
			}
			
			if (_hasPush) {//if list really changed
				updateUploadBytes();
				_info.setInfo(UploaderInfo.LIST_CHANGED);
			}
		}
		
		private function _onError(evt: IOErrorEvent):void
		{
			_uploadItem.isError = true;
			_isUploading = false;
			remUploadLsn(_uploadItem.fileRef);
			_info.setInfo(UploaderInfo.FILE_ERROR, _uploadItem);
			
			start();
		}
		
		private function _onComplete(evt: Event):void
		{
			
		}
		
		private function _onCompleteData(evt: DataEvent):void
		{
			_uploadItem.isUploaded = true;
			_isUploading = false;
			_uploadItem.response = evt.data;
			remUploadLsn(_uploadItem.fileRef);
			_info.setInfo(UploaderInfo.FILE_COMPLETE, _uploadItem);
			
			
			start();//next
		}
		
		private function _onProgress(evt: ProgressEvent):void
		{
			_fileProgress.value = evt.bytesLoaded / evt.bytesTotal;
			_totalProgress.value = (evt.bytesLoaded + _bytesUpload) / _bytesTotal;
		}
		
		
	/***********************
	 * 	PUBLIC METHODS
	 **********************/
		
		public function browse(pmulti:Boolean, pappend:Boolean = true):void
		{
			if (!pappend) {
				_list = [];
				_bytesTotal = 0;
				_bytesUpload = 0;
				_info.setInfo(UploaderInfo.LIST_CHANGED);
			}
			
			if (pmulti) {
				_fileList = new FileReferenceList();
				_fileList.addEventListener(Event.SELECT, _onListSelect);
				_fileList.browse(_filters);
			} else {
				_fileRef = new FileReference();
				_fileRef.addEventListener(Event.SELECT, _onFileSelect);
				_fileRef.browse(_filters);
			}
		}
		
		public function replace(id:int):void
		{
			//TODO : use the fileRef at id
		}
		
		public function start():void
		{
			//TODO : add variables support while sending files to server
			if (!_isUploading) {
				getFirstUploadItem();
				if (_uploadItem) {
					_isUploading = true;
					addUploadLsn(_uploadItem.fileRef);
					//var req : URLRequest = new URLRequest(serverURL+ obj2Request(uploadData));
					var req : URLRequest = new URLRequest(_server);
					_uploadItem.fileRef.upload(req);
				}
			}
			
		}
		
		public function stop():void
		{
			if (_isUploading) {
				_isUploading = false;
				_uploadItem.fileRef.cancel();
				remUploadLsn(_uploadItem.fileRef);
			}
		}
		
		
	/***********************
	 * 	GETTERS
	 **********************/
		
		public function get list():Array { return _list; }
		
		public function get info():Info	{ return _info; }
		
		public function get fileProgress():Numeric { return _fileProgress; }
		
		public function get totalProgress():Numeric { return _totalProgress; }
		
	}

}

import flash.net.FileReference;

dynamic class UploadItem {
	public var fileRef		: FileReference;
	public var id			: String; //id to compare duplication : name+size+type
	public var isUploaded	: Boolean; // is this file uploaded or not
	public var isError		: Boolean;
	public var response		: String; //this can be the url after the file is uploaded or any message that the server returned
	public var isValid		: Boolean; //maybe the file is not valid but user don't want to remove it, just put it there disabled
	
	public function UploadItem(pfr : FileReference, pvalid : Boolean, pid: String) {
		fileRef = pfr;
		isValid = pvalid;
		id = pid;
	}
	
	public function toString():String 
	{
		return id;
	}
}