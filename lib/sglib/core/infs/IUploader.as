package sglib.core.infs 
{
	import sglib.core.data.Info;
	import sglib.core.data.Numeric;
	import sglib.core.data.State;
	
	/**
	 * @version 0.1.0
	 * @author thienhaflash (thienhaflash@gmail.com)
	 * @update 10 May 2010 (0.1.0)
	 */
	public interface IUploader 
	{
		function setServer(pserver	: String): IUploader;
		function setFilter(pfilter	: Array): IUploader;
		function setSizeLimit(pmin:Number = 0, pmax:Number = Infinity):IUploader
		function autoRemove(pfilter:Boolean, psize:Boolean = true):IUploader/* auto remove invalid files */
		
		function browse(pmulti: Boolean, pappend: Boolean = true):void;
		function replace(id: int):void; /* browse 1 item in replace of the item at id i */
		function start():void;
		function stop():void;
		//function cancel():void;//will reset position
		
		function get list(): Array; /* of Uploader Item */
		function get info(): Info;
		function get fileProgress(): Numeric;
		function get totalProgress(): Numeric;		
	}
	
}